//
//  RegistrationView.swift
//  
//
//  Created by Rider on 2026/10/01.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var cellNumber = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                InputFieldTextCell(
                    inputField: $name,
                    title: "Name",
                    placeHolder: "Enter your name",
                    systemImage: "person"
                )
                
                InputFieldTextCell(
                    inputField: $surname,
                    title: "Surname",
                    placeHolder: "Enter your surname",
                    systemImage: "person"
                )
                
                InputFieldTextCell(
                    inputField: $email,
                    title: "Email",
                    placeHolder: "Enter your email",
                    systemImage: "envelope"
                )
                
                InputFieldTextCell(
                    inputField: $cellNumber,
                    title: "Cell Number",
                    placeHolder: "Enter your cell number",
                    systemImage: "phone"
                )
                
                InputFieldTextCell(
                    inputField: $password,
                    title: "Password",
                    placeHolder: "Enter your password",
                    systemImage: "lock"
                )
                
                InputFieldTextCell(
                    inputField: $confirmPassword,
                    title: "Confirm Password",
                    placeHolder: "Confirm your password",
                    systemImage: "lock"
                )
                
                Button(action: {
                    // Register action
                }) {
                    Text("Register")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(20)
                }
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            Color.gray.opacity(0.4),
                            lineWidth: 1
                        )
                )
                .padding(.horizontal, 20)
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Already have an account? Sign In")
                        .font(.system(size: 15))
                        .foregroundColor(Color.black.opacity(0.5))
                }
                .frame(maxWidth: .infinity)
                .padding(20)
            }
            .padding(.top, 15)
        }
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
    }
}

