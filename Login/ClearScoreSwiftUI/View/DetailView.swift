//
//  DetailView.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/06/16.
//

import SwiftUI

struct DetailView: View {
    var viewModel: ClearScoreViewModel?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Group {
                
                let hasEverDefaulted = self.viewModel?.scoreModel?.creditReportInfo?.hasEverDefaulted == true ? "Yes" : "No"
                LabelSection(labelOne: "Has ever Defaulted", labelTwo:  "\(hasEverDefaulted)")
                LabelSection(labelOne: "Months since last defaulted ", labelTwo: "\(viewModel?.scoreModel?.creditReportInfo?.monthsSinceLastDefaulted ?? 0)")
                
                LabelSection(labelOne: "Current short term debt", labelTwo: "\(self.viewModel?.scoreModel?.creditReportInfo?.currentShortTermDebt ?? 0)")
                LabelSection(labelOne: "Change in short term debt", labelTwo: "\(self.viewModel?.scoreModel?.creditReportInfo?.changeInShortTermDebt ?? 0)")
                LabelSection(labelOne: "Current long term debt", labelTwo: "\(self.viewModel?.scoreModel?.creditReportInfo?.currentLongTermDebt ?? 0)")
            }
        }
        .navigationTitle("Details")
        .toolbarTitleDisplayMode(.inline)
       .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .tint(.black)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    DetailView()
}
