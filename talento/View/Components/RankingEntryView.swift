//
//  RankingEntryView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase

struct RankingEntryView: View {

    var entry: entry
    var rank: Int
    @ObservedObject var userList = UserList()
    

    var body: some View {
        HStack(spacing: 16) {
            MediaEntryPictureView(entry: entry)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(userList.getUserwithId(id: entry.author))
                        .font(.system(size: 16, weight: .bold))
                    Text(String("Likes: " + String(Int(entry.likes))))
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

