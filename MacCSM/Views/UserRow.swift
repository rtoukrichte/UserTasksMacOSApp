//
//  UserRow.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import SwiftUI

struct UserRow: View {
    var user: UserModel
    
    
    
    var body: some View {
        
            VStack(alignment: .leading) {
                Text(user.name ?? "")
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .frame(minWidth: 20)
                
                Spacer()
                
                Text("@\(user.username ?? "")")
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
                
                
                Text(user.email ?? "")
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
            }
        
        
        
        //                if landmark.isFavorite {
        //                    Image("star-filled")
        //                        .resizable()
        //                        .renderingMode(.template)
        //                        .foregroundColor(.yellow)
        //                        .frame(width: 10, height: 10)
        //                }
        
        .padding(.vertical, 5)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: UserModel(id: 1, name: "Reda Test", username: "adira_test", email: "reda@gmail.com", phone: "", website: ""))
    }
}
