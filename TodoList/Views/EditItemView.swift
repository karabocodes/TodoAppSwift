//
//  EditItemView.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/31.
//

import SwiftUI

struct EditItemView: View {
    @StateObject var viewModel: EditItemViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Edit Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                TextField("Description", text: $viewModel.description)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .textFieldStyle(DefaultTextFieldStyle())
                
                Picker("Priority", selection: $viewModel.priority) {
                    Text("Low").tag("Low")
                    Text("Medium").tag("Medium")
                    Text("High").tag("High")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button(action: {
                    if viewModel.canSave {
                        viewModel.save()
                        isPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }) {
                    Text("Save")
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill all fields"))
                }
            }
        }
    }
}
