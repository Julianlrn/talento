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
    @State var isPresented = false
    
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
            ZStack {
                if self.index == 0 {
                    FeedView()
                }
                else if self.index == 1 {
                    ChallengeView()
                }
                else if self.index == 2 {
                    ProfileView()
                }
                else if self.index == 3 {
                    SettingsView()
                }
            }
            
            TabBar(index: $index, isPresented: $isPresented)
            .cornerRadius(16)
            .padding(.top, -16)
            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.04), radius: 16, x: 0, y: -8)
        }
        .sheet(isPresented: $isPresented, content: {
            ChallengeCreateView()
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBar : View {
    
    @Binding var index : Int
    @Binding var isPresented : Bool
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            HStack {
                Image(systemName: self.index == 0 ? "house.fill" : "house")
                    .resizable()
                    .frame(width: 26, height: 24)
                    .foregroundColor(self.index == 0 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }
            .padding(.horizontal, 12)
            .onTapGesture {
                self.index = 0
            }
            
            HStack {
                Image(systemName: self.index == 1 ? "bolt.fill" : "bolt")
                    .resizable()
                    .frame(width: 15, height: 24)
                    .foregroundColor(self.index == 1 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }
            .padding(.horizontal, 12)
            .onTapGesture {
                self.index = 1
            }
            
            Button(action: {
                self.isPresented.toggle()
            }, label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 26, height: 24)
                    .foregroundColor(Color.init(red:1.00, green:1.00, blue:1.00, opacity: 1.00))
                    .padding(16)
                    .cornerRadius(16)
            })
            .background(Color.init(red:0.96, green:0.11, blue:0.34))
            .cornerRadius(16)
            .padding(.horizontal, 12)
            
            HStack {
                Image(systemName: self.index == 2 ? "person.fill" : "person")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(self.index == 2 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
            }
            .padding(.horizontal, 12)
            .onTapGesture {
                self.index = 2
            }
            
            HStack {
                 Image(systemName: self.index == 3 ? "slider.horizontal.3" : "slider.horizontal.3")
                     .resizable()
                     .frame(width: 26, height: 24)
                     .foregroundColor(self.index == 3 ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.24))
             }
             .padding(.horizontal, 12)
             .onTapGesture {
                 self.index = 3
             }

        }.padding(.top, 12)
        .padding(.bottom, 32)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

