//
//  ContentView.swift
//  talento
//
//  Created by Julian Lorenz on 08.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        
        /*
        @EnvironmentObject var loginStatus:LoginCheck
        if loginStatus.loading == true {
            return AnyView(Text("Loading"))
        }
        else if loginStatus.loggedIn == false {
            return AnyView(login().frame(width: 100, height: 50))
        }
        */
        
        VStack {
            
            if self.index == 0 {
                FeedView()
            }
            else if self.index == 1 {
                ChallengeView()
            }
            else if self.index == 2 {
                ChallengeCreateView()
            }
            else if self.index == 3 {
                ActivityView()
            }
            else if self.index == 4 {
                ProfileView()
            }

            
            TabBar(index : $index)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBar : View {
    
    @Binding var index : Int
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            HStack {
                Image(systemName: self.index == 0 ? "house.fill" : "house")
                    .resizable()
                    .frame(width: 26, height: 24)
                    .foregroundColor(self.index == 0 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }.padding(.vertical, 12)
            .padding(.horizontal, 16)
            .onTapGesture {
                self.index = 0
            }
            
            HStack {
                Image(systemName: self.index == 1 ? "bolt.fill" : "bolt")
                    .resizable()
                    .frame(width: 15, height: 24)
                    .foregroundColor(self.index == 1 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }.padding(.vertical, 12)
            .padding(.horizontal, 16)
            .onTapGesture {
                self.index = 1
            }
            
            HStack {
                Image(systemName: self.index == 2 ? "paperplane.fill" : "paperplane")
                    .resizable()
                    .frame(width: 26, height: 24)
                    .foregroundColor(self.index == 2 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }.padding(.vertical, 12)
            .padding(.horizontal, 16)
            .onTapGesture {
                self.index = 2
            }
            
            HStack {
                Image(systemName: self.index == 3 ? "suit.heart.fill" : "suit.heart")
                    .resizable()
                    .frame(width: 25, height: 24)
                    .foregroundColor(self.index == 3 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }.padding(.vertical, 12)
            .padding(.horizontal, 16)
            .onTapGesture {
                self.index = 3
            }
            
            HStack {
                Image(systemName: self.index == 4 ? "person.fill" : "person")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(self.index == 4 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }.padding(.vertical, 12)
            .padding(.horizontal, 16)
            .onTapGesture {
                self.index = 4
            }

        }.padding(.top, 12)
        .padding(.bottom, 32)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white)
        .cornerRadius(16)
    }
}
