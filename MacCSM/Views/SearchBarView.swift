//
//  SearchBarView.swift
//  MacCSM
//
//  Created by rtoukrichte on 18/01/2022.
//

import SwiftUI

typealias UITextField = NSTextField
extension UITextField {
    open override var focusRingType: NSFocusRingType
    {
        get { .none }
        set { }
    }
}

struct SearchBarView: View {
    
    @Binding var searchText: String
    var placeholder: String = "Search"
    
    var body: some View {
        
        HStack{
            Image.init(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 13, height: 13)
                .opacity(0.9)
            
            TextField(placeholder, text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .background(Color.clear)
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            if searchText != "" {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image.init(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(8)
        .background(Color.gray.opacity(0.15))
        .padding(.horizontal, 10)
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}



