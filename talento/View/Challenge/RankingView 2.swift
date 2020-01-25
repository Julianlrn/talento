//
//  RankingView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct RankingView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    VStack {
                        Image("sushi")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .cornerRadius(16)
                        Image(systemName: "2.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.init(red:0.73, green:0.73, blue:0.73))
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 12, x: 0, y: 6)
                            .offset(y: -40)
                    }
                    VStack {
                        Image("skateboard")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130)
                            .cornerRadius(16)
                        Image(systemName: "1.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.init(red:0.95, green:0.81, blue:0.10))
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 12, x: 0, y: 6)
                            .offset(y: -40)
                    }
                    VStack {
                        Image("mountain")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .cornerRadius(16)
                        Image(systemName: "3.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.init(red:0.90, green:0.39, blue:0.06))
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 12, x: 0, y: 6)
                            .offset(y: -40)
                    }
                }
                .padding(.top, 16)
                
                ForEach(4 ..< 11) { number in
                    RankingEntryView(rank: number)
                }
                
            }
            .padding(.horizontal, 16)
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
