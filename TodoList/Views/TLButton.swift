//
//  TLButton.swift
//  TodoList
//
//  Created by Nagarro on 2024/07/08.
//

import SwiftUI

struct TLButton: View {
    
    let title : String
    let background: Color
    let action : () -> Void
    
    var body: some View {
        Button { // using a closure
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", 
             background: .pink){
        
    }
}
