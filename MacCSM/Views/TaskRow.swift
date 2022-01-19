//
//  TaskRow.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import SwiftUI

struct TaskRow: View {
    var task: TaskModel
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Rectangle().fill((task.status ?? false) ? Color.green : Color.orange)
                .frame(width: 15, height: 15, alignment: .center)
                .cornerRadius(15/2)
            
            //Spacer()
            
            Text(task.title ?? "")
                .fontWeight(.bold)
                .truncationMode(.tail)
                .frame(minWidth: 20)
            
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: TaskModel(id: 1, userId: 1, title: "test data title", status: false))
    }
}
