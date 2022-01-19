//
//  ContactView.swift
//  MacCSM
//
//  Created by rtoukrichte on 18/01/2022.
//

import SwiftUI


struct ContactView: View {
    @State private var show = false
    
    var body: some View {
        VStack{
            if !show {
                RootView(show: $show)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .transition(AnyTransition.move(edge: .leading)).animation(.default)
            }
            if show {
                NextView(show: $show)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                    .transition(AnyTransition.move(edge: .trailing)).animation(.default)
            }
        }
        .onAppear() {
            setTitle("Contact")
        }
    }
    
    func setTitle(_ title: String) {
        if let mainApp = NSApplication.shared.delegate as? AppDelegate {
            //mainApp.window.title = title
        }
    }
}

struct RootView: View {
    @Binding var show: Bool
    var body: some View {
        VStack{
            Button("Next") { self.show = true }
            Text("This is the first view")
        }
//        .toolbar {
//            //            ToolbarItem(placement: .automatic) {
//            //                Button(action: {
//            //                    print("reload data")
//            //                }) {
//            //                    Image(systemName: "arrow.clockwise")
//            //                }
//            //            }
//        }
        .navigationTitle("Contact")
    }
}

struct NextView: View {
    @Binding var show: Bool
    var body: some View {
        VStack{
            Button("Back") { self.show = false }
            Text("This is the second view")
        }
//        .toolbar {
////            ToolbarItem(placement: .automatic) {
////                Button(action: {
////                    print("reload data")
////                }) {
////                    Image(systemName: "arrow.clockwise")
////                }
////            }
//        }
        .navigationTitle("Next View")
        
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
