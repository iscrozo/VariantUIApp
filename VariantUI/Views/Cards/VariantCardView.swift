//
//  VariantCardView.swift
//  VariantUI
//
//  Created by Camilo Rozo on 8/11/23.
//

import SwiftUI

struct VariantCardView: View {
    var title: String?
    var description: String?
    var content: String?
    var footer: String?
    var backgroundColor: Color?
    var titleColor: Color?
    var descriptionColor: Color?
    var contentColor: Color?
    var footerColor: Color?

    var body: some View {
        VStack(spacing: 12) {
            Group {
                if let title = title {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(titleColor ?? .primary)
                }
                
                if let description = description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(descriptionColor ?? .gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let content = content {
                Text(content)
                    .font(.callout)
                    .foregroundStyle(contentColor ?? .primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if let footer = footer {
                Text(footer)
                    .font(.caption)
                    .foregroundStyle(footerColor ?? .gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 22)
        .background(backgroundColor ?? .clear)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray)
        )
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
    }
}


/* XCODE < 15 */
struct VariantCardView_Previews: PreviewProvider {
    static var previews: some View {
        VariantCardView(
            title: "Card title #1",
            description: "Card description",
            content: "Card content",
            footer: "Card footer"
        )
    }
}

/* XCODE >=15 */
//#Preview {
//    VariantCardView(
//        title: "Card title #1",
//        description: "Card description",
//        content: "Card content",
//        footer: "Card footer"
//    )
//}
//}



