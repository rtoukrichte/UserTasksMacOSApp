//
//  AppSideBarView.swift
//  MacCSM
//
//  Created by rtoukrichte on 18/01/2022.
//

import SwiftUI

struct AppSideBarView: View {
    @State var selectedItem: String?
    
    var body: some View {
        NavigationView {
            List(CSMItems.allCases, id: \.name) { item in
                
                let label = Label(item.name, systemImage: item.icon)
                
                if item == CSMItems.users {
                    NavigationLink(destination:
                                    UsersListView()) {
                        label
                    }.padding(4)
                }
                else {
                    NavigationLink(destination:
                                    ContactView()) {
                        label
                    }.padding(4)
                }
            
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 150, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
        }
    }
}

struct AppSideBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppSideBarView()
    }
}
