//
//  ChallengeDetailView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI

struct ChallengeDetailView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var tabIndex = 0
    
    var challenge: Challenge
    
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - TABS
            HStack(spacing: 16) {
                HStack {
                    Text("General")
                        .foregroundColor(self.tabIndex == 0 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                }
                .padding(16)
                .background(self.tabIndex == 0 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                .cornerRadius(16)
                .onTapGesture {
                    self.tabIndex = 0
                }
                
                HStack {
                    Text("Rating")
                    .foregroundColor(self.tabIndex == 1 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                }
                .padding(16)
                .background(self.tabIndex == 1 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                .cornerRadius(16)
                .onTapGesture {
                    self.tabIndex = 1
                }
                
                HStack {
                    Text("Ranking")
                    .foregroundColor(self.tabIndex == 2 ? Color.init(red:1.00, green:1.00, blue:1.00) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.32))
                }
                .padding(16)
                .background(self.tabIndex == 2 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.06))
                .cornerRadius(16)
                .onTapGesture {
                    self.tabIndex = 2
                }
            }
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
            
            if self.tabIndex == 0 {
                General(challenge: self.challenge)
            }
            else if self.tabIndex == 1 {
                Rating(challenge: self.challenge)
            }
            else if self.tabIndex == 2 {
                Ranking(challenge: self.challenge)
            }
            
            Spacer()
        }
    }
}


struct General: View {

    //var challenges: [Challenge] = getChallengeData()
    // var imageLoader: ImageLoader
    var challenge: Challenge
    
    var body: some View {
        // ForEach(challenges) { item in
        GeneralView(challenge: challenge, imageLoader: ImageLoader(urlString: challenge.image))
        //}
    }
}

struct Rating: View {
    
    var challenge: Challenge

    var body: some View {
        RatingView(challenge: challenge)
    }
}

struct Ranking: View {
    
    var challenge: Challenge

    var body: some View {
        RankingView(challenge: self.challenge)
    }
}


/*struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(challenge: challengesData[0])
            //.previewLayout(.sizeThatFits)
    }
}*/
