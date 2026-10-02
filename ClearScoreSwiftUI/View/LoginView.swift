//
//  LoginView.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/10/01.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @StateObject  var viewModel: ClearScoreViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Image("score.png")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 10)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            
            InputFieldTextCell(
                inputField: $email,
                title: "Email",
                placeHolder: "Enter your email",
                systemImage: "envelope")
            
            InputFieldTextCell(
                inputField: $password,
                title: "Password",
                placeHolder: "Enter your password",
                systemImage: "lock")
            
            Button(action: {
                navigateToHome = true
            }) {
                Text("Login")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        Color.gray.opacity(0.4),
                        lineWidth: 1)
            )
            .padding(.horizontal, 20)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView(viewModel: viewModel)
            }
            NavigationLink {
                      RegistrationView(viewModel: viewModel)
                   } label: {
                       Text("Don't have an account? Sign Up")
                           .font(.system(size: 15))
                           .foregroundColor(Color.black.opacity(0.5))
                   }
                   .frame(maxWidth: .infinity)
                   .padding(20)
        }
    }
}

//#Preview {
//    LoginView()
//}
