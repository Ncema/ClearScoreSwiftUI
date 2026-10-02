//
//  InputFieldTextCell.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/09/25.
//

import SwiftUI

struct InputFieldTextCell: View {
    
    @Binding var inputField: String
    let title: String
    let placeHolder: String
    let systemImage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.system(size: 13, weight: .regular))
                .padding(.leading, 30)
            
            HStack(spacing: 10) {
                
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                TextField(placeHolder, text: $inputField)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    Color.gray.opacity(0.4),
                    lineWidth: 0.3
                )
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    @State var email = ""
    InputFieldTextCell(inputField: $email, title: "email", placeHolder: "Enter your email", systemImage: "envelope")
}
