//
//  LebelSection.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/06/16.
//

import SwiftUI

struct LabelSection: View {
    var labelOne: String = ""
    var labelTwo: String = ""
    
    var body: some View {
            HStack(alignment: .top, spacing: 20) {
                Text("\(labelOne) :")
                    .font(.system(size: 15, weight: .regular))
                Text(labelTwo)
                    .font(.system(size: 15, weight: .regular))
            }
    }
}

#Preview {
    LabelSection()
}
