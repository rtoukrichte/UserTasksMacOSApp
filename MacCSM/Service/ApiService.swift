//
//  ApiService.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import Foundation
import Alamofire

struct Constants {
    static let baseUrl      = "https://jsonplaceholder.typicode.com"
    static let usersListUrl = Constants.baseUrl + "/users"
    static let tasksListUrl = Constants.baseUrl + "/todos?userId="
}

class ApiService {
    
    // MARK: - singleton instance
    static let shared = ApiService()
    
    private init() {}
    
    lazy var manager = NetworkReachabilityManager(host: "jsonplaceholder.typicode.com")
    
    // MARK: - Load Informations From users WebService
    func loadUsers(completionHandler:@escaping (Bool, [UserModel]?) -> ()) {
        AF.request(Constants.usersListUrl, encoding: URLEncoding.default)
            .responseJSON { response in

                switch response.result {
                case .success:
                    print("Fetching Users ===> case Success")
                    if let result = response.data {
                        do {
                            let users = try JSONDecoder().decode([UserModel].self, from: result)
                            completionHandler(true, users)
                        }
                        catch let jsonErr {
                            print("Error" , jsonErr)
                            completionHandler(true, nil)
                        }

                    } else {
                        completionHandler(false, nil)
                    }
                    break
                case .failure(let error):
                    print("@@@@@@@ Error == ", error.localizedDescription)
                    completionHandler(false, nil)
                    break
                }
        }
    }
    
    //
    func loadTasksUser(userId: Int, completionHandler:@escaping ([TaskModel]?, CSMError?) -> ()) {
        
        let url = Constants.tasksListUrl + "\(userId)"
        
        AF.request(url, encoding: URLEncoding.default)
            .responseJSON { response in

                switch response.result {
                case .success:
                    print("Fetching Tasks ===> case Success")
                    if let result = response.data {
                        do {
                            let tasks = try JSONDecoder().decode([TaskModel].self, from: result)
                            completionHandler(tasks, nil)
                        }
                        catch let jsonErr {
                            print("Error" , jsonErr)
                            completionHandler(nil, CSMError(jsonErr))
                        }
                        
                    } else {
                        completionHandler(nil, CSMError("Data non disponible"))
                    }
                    break
                case .failure(let error):
                    print("Fetching Tasks ===> case Failure")
                    print("@@@@@@@ Error == ", error.localizedDescription)
                    completionHandler(nil, CSMError(error))
                    break
                }
        }
    }
    
    // MARK: - Network Reachability
    func isNetworkReachable() -> Bool {
        return manager?.isReachable ?? false
    }
}
