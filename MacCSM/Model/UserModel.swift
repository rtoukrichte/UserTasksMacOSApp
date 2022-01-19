//
//  UserModel.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import Foundation

struct UserModel: Codable, Hashable, Identifiable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let phone: String?
    let website: String?
}


let usersData: [UserModel] = []
let tasksData: [TaskModel] = []

final class UserData: ObservableObject {
    //@Published var showFavoritesOnly = false
    @Published var users = usersData
    @Published var tasksUser = tasksData
}
