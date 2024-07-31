//
//  LoginView.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/04.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack {
                
                //header
                HeaderView(title : "Git To Do List",
                           subtitle : "Get Things Done",
                           angle : 15,
                           background: .pink)
                //login
                
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password" , text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Log In", 
                             background: .blue, action:{
                        //attempt log in
                        viewModel.login()
                    })
                    
                    .padding()
                }
                .offset(y: -50)
                
                //create account
                VStack{
                    Text("Are You New here")
                    NavigationLink("Create an account",
                    destination: RegisterView())                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
