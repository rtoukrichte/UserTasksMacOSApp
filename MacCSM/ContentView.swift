//
//  ContentView.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AppSideBarView()
            .navigationTitle("CSM App")
        //Text("Home")
//        NavigationView {
//            UsersListView()
//        }
        .frame(minWidth: 700, minHeight: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
