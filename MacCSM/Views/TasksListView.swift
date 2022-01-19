//
//  TasksList.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import SwiftUI

struct TasksListView: View {
    //@EnvironmentObject private var userData: UserData
    @State var tasks: [TaskModel] = []
    var user: UserModel
    @State var error: CSMError?
    
    @State var shouldDismissed: Bool = false
    
    var body: some View {
        view
            .toolbar {

                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        print("reload data")
                        refreshTasks()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        self.tasks = []
                        self.shouldDismissed = true
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                
//                ToolbarItem(placement: .principal) {
//                    Text("principal")
//                        .border(Color.blue)
//                }
                
//                ToolbarItem(placement: .primaryAction) {
//                    Text("primaryA")
//                        .border(Color.blue)
//                }
//
//                ToolbarItem(placement: .confirmationAction) {
//
//                    Text("confirmationA")
//
//                }
//
//                ToolbarItem(placement: .destructiveAction) {
//                    Text("destructiveA")
//                        .border(Color.red)
//
                //}
                
                
            }
            .navigationTitle("\(user.name ?? "")'s tasks")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        
    }
    
    private func refreshTasks() {
        self.tasks = []
        startFetching()
    }
    
    @ViewBuilder
    private var view: some View {
        if !shouldDismissed {
        if tasks.count != 0 {
            List() {
                ForEach(tasks) { task in
                    HStack {
                        TaskRow(task: task).tag(task)
                        Spacer()
                    }
                    .padding(5)
                }
            }
        }
        else {
            if error != nil {
                VStack {
                    Label(error!.localizedDescription, systemImage: "exclamationmark.triangle")
                }
            }
            else {
                VStack {
                    if #available(macOS 11.0, *) {
                        ProgressView()
                    } else {
                        // Fallback on earlier versions
                    }
                }
                .onAppear {
                    startFetching()
                    //setTitle(title: (user.name ?? "")+"'s tasks")
                }
            }
        }
        }
    }
    
    func startFetching() {
        ApiService.shared.loadTasksUser(userId: self.user.id ?? 1) { (tasks, error) in
            if tasks != nil && error == nil {
                self.tasks = tasks!
            }
            else if let e = error {
                self.error = e
            }
        }
    }
    
    func setTitle(title: String) {
        if let mainApp = NSApplication.shared.delegate as? AppDelegate {
            //mainApp.window.title = title
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView(user: UserModel(id: 1, name: "", username: "", email: "", phone: "", website: ""))
    }
}

