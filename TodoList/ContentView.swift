//
//  ContentView.swift
//  TodoList
//
//  Created by Andia Doma on 1/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var tasks = [String]()
    
    var body: some View {
        VStack {
            TextField("Enter task", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibility(identifier: "taskTextField")
            Button("Add") {
                self.tasks.append(self.taskName)
            }.accessibility(identifier: "addTaskButton")
            
            List(self.tasks, id: \.self) { name in
                Text("\(name)")
            }
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
