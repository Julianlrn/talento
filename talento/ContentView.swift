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
            
            ZStack {
                
                if self.index == 0 {
                    Color.red.edgesIgnoringSafeArea(.top)
                }
                else if self.index == 1 {
                    Color.blue.edgesIgnoringSafeArea(.top)
                }
                else if self.index == 2 {
                    Color.green.edgesIgnoringSafeArea(.top)
                }
                else if self.index == 3 {
                    Color.yellow.edgesIgnoringSafeArea(.top)
                }
                else {
                    Color.white.edgesIgnoringSafeArea(.top)
                }
            }
            
            TabBar(index : $index)
            
        }.animation(.spring())
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
        
        HStack(spacing: 15) {
            
            HStack {
                
                Image(systemName: "house").resizable().frame(width: 26, height: 24)
                Text(self.index == 0 ? "Feed" : "").fontWeight(.light).font(.system(size: 14))
            }.padding(15)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 0
            }
            
            HStack {
                
                Image(systemName: "bolt")
                    .resizable().frame(width: 15, height: 24)
                Text(self.index == 1 ? "Challenges" : "").fontWeight(.light).font(.system(size: 14))
            }.padding(15)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 1
            }
            
            HStack {
                
                Image(systemName: "suit.heart").resizable().frame(width: 25, height: 24)
                Text(self.index == 2 ? "Activity" : "").fontWeight(.light).font(.system(size: 14))
            }.padding(15)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 2
            }
            
            HStack {
                
                Image(systemName: "person").resizable().frame(width: 24, height: 24)
                Text(self.index == 3 ? "Profile" : "").fontWeight(.light).font(.system(size: 14))
            }.padding(15)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 3
            }

        }.padding(.top, 8)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white)
        .animation(.default)
    }
}
