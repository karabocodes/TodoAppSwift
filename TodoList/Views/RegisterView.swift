//
//  RegisterView.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/04.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        
        //header
        VStack{
            HeaderView(title : "Register",
                       subtitle : "Start Organising Your Life",
                       angle : -15,
                       background: .orange)
            
            
            // forms
            Form{
                TextField("Your Name" , text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Your Email Address" , text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Create A Password" , text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .orange, action:{
                    //attempt log in
                    viewModel.register()
                })
                .padding()
            
            }
            .offset(y:-50)
            
        }
        
        
    }
}

#Preview {
    RegisterView()
}
