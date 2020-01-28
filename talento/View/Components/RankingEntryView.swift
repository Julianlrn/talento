//
//  RankingEntryView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct RankingEntryView: View {
    
    var rank: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("andrea_mirella")
                        .font(.system(size: 16, weight: .bold))
                    Text("322 likes")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                }
                .padding(.leading, 8)
                
                Spacer()
                
                Text("\(rank)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.gray)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(16)
            }
            .frame(width: 215)
            .padding(16)
            .background(Color.init(red: 0.00, green: 0.00, blue: 0.00, opacity: 0.06))
            .cornerRadius(16)
        }
    }
}
