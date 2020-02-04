//
//  RankingView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct RankingView: View {
    
    @ObservedObject var data = SortedEntriesData()
    var challenge: Challenge

    @ObservedObject var userList = UserList()
    
    
    var body: some View {
        let filteredData  = self.data.sortedEntriesData.filter{$0.idFromChallenge.contains(challenge.fbId)}
        
        if(filteredData.count == 0){
            return AnyView(Text("Loading"))
        } else if (filteredData.count < 3) {
            return AnyView(Text("Not enough participants").font(.title))
        }
        else {
            let count = filteredData.count
            return AnyView(
                ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    HStack(spacing: 16) {
                        VStack {
                            ZStack {
                                MediaEntryPictureView(entry: filteredData[1])
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90, height: 90)
                                    .cornerRadius(16)
                                HStack {
                                    Image(systemName: "2.circle")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(Color.init(red:0.73, green:0.73, blue:0.73))
                                        .padding(16)
                                        .background(Color.white)
                                        .cornerRadius(16)
                                        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 12, x: 0, y: 6)
                                }
                                .padding(.top, 60)
                            }
                            Text(userList.getUserwithId(id: filteredData[1].author))
                                .font(.system(size: 16, weight: .bold))
                            Text(String("Likes: " + String(Int(filteredData[1].likes))))
                                .font(.system(size: 14))
                                .foregroundColor(Color.gray)
                        }
                        VStack {
                            ZStack {
                                MediaEntryPictureView(entry: filteredData[0])
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(16)
                                HStack {
                                    Image(systemName: "1.circle")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(Color.init(red:0.95, green:0.81, blue:0.10))
                                        .padding(16)
                                        .background(Color.white)
                                        .cornerRadius(16)
                                        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 12, x: 0, y: 6)
                                }
                                .padding(.top, 80)
                            }
                            Text(userList.getUserwithId(id: filteredData[0].author))
                                .font(.system(size: 16, weight: .bold))
                            Text(String("Likes: " + String(Int(filteredData[0].likes))))
                                .font(.system(size: 14))
                                .foregroundColor(Color.gray)
                        }

                        
                        VStack {
                            ZStack {
                                MediaEntryPictureView(entry: filteredData[2])
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90, height: 90)
                                    .cornerRadius(16)
                                HStack {
                                    Image(systemName: "3.circle")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(Color.init(red:0.90, green:0.39, blue:0.06))
                                        .padding(16)
                                        .background(Color.white)
                                        .cornerRadius(16)
                                        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24), radius: 12, x: 0, y: 6)
                                }
                                .padding(.top, 60)
                            }
                            Text(userList.getUserwithId(id: filteredData[2].author))
                                .font(.system(size: 16, weight: .bold))
                            Text(String("Likes: " + String(Int(filteredData[2].likes))))
                                .font(.system(size: 14))
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding(.top, 16)

                    if count > 2 {
                        ForEach(3..<count) { number in
                            RankingEntryView(entry: filteredData[number], rank: number+1)
                        }
                    }


                }
                .padding(.horizontal, 16)
            })
        }
        
    }
}


//struct RankingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RankingView()
//    }
//}
