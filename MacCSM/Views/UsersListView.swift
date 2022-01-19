//
//  UserTasks.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import SwiftUI

struct UsersListView: View {
    //@EnvironmentObject private var userData: UserData
    @State var users: [UserModel] = []
    @State private var selectedUser: UserModel?
    
    @State private var searchText = ""
    @State private var resultCountText = ""
    
    let bg = Color("ControlBackgroundColor")
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                SearchBarView(searchText: $searchText)
                Spacer()
                List(users.filter({($0.name?.lowercased().contains(searchText.lowercased()))! || ($0.username?.lowercased().contains(searchText.lowercased()))! || searchText.isEmpty })) { user in
                    
                    HStack {
                        UserRow(user: user).tag(user)
                        Spacer()
                    }.padding(5)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    NavigationLink(
                        destination: TasksListView(user: user), tag: user, selection: $selectedUser,
                        label: {
                            Text("")
                        })
                    
                }
                .frame(minWidth: 200, idealWidth: 200)
            }
            
        }
        .onAppear {
            //setTitle("CSM Users")
            startFetchingUsers()
            //resultCountText = (self.users.count == 0) ? "No result" : "Result search count: \(self.users.count)"
        }
        .toolbar {
//            ToolbarItem(placement: .automatic) {
//                Button(action: {
//                    print("reload data")
//                }) {
//                    Image(systemName: "arrow.clockwise")
//                }
//            }
            ToolbarItem(placement: .cancellationAction) {
                if searchText != "" {
                    let filtredUsers = users.filter({($0.name?.lowercased().contains(searchText.lowercased()))! || ($0.username?.lowercased().contains(searchText.lowercased()))! || searchText.isEmpty })
                    Text((filtredUsers.count == 0) ? "No result" : "Result search count: \(filtredUsers.count)")
                }
            }
        }
        .navigationTitle("Users")

    }
    
    func startFetchingUsers() {
        ApiService.shared.loadUsers { succes, users in
            if succes && users != nil {
                self.users = users!
            }
        }
    }
    
//    func setTitle(_ title: String) {
//        if let mainApp = NSApplication.shared.delegate as? AppDelegate {
//            //mainApp.window.title = title
//        }
//    }
}

struct UserTasksView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}

