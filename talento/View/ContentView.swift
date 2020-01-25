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
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        VStack {
            
            if status {
                
                Home()
            }
            else {
                
                NavigationView {
                    AuthenticationPage()
                }
            }
        }.onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
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

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AuthenticationPage : View {
    
    @State var ccode = ""
    @State var no = ""
    @State var show = false
    @State var msg = ""
    @State var alert = false
    @State var ID = ""
    
    var body : some View {
        
        VStack(spacing : 20) {
            
            Image("logo") //doesn't work, why?
            
            Text("Verify Your Number").font(.largeTitle).fontWeight(.heavy)
            
            Text("Please Enter Your Number To Verify Your Account")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 12)
            
            HStack {
                
                TextField("+1", text: $ccode)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .padding()
                    .background(Color("Color")) //doesn't work, why?
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("Number", text: $no)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color("Color")) //doesn't work, why?
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }.padding(.top, 15)
            
            NavigationLink(destination: LoginPage(show: $show, ID: $ID), isActive: $show){
                
                Button(action: {
                    
                    PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate: nil) { (ID, err) in
                        
                        if err != nil {
                            
                            self.msg = (err?.localizedDescription)!
                            self.alert.toggle()
                            return
                            
                        }
                        
                        self.ID = ID!
                        self.show.toggle()
                        
                    }
                    
                }) {
                    
                    Text("Send").frame(width: UIScreen.main.bounds.width - 30, height: 50 )
                }.foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
            }
            

            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }.padding()
        .alert(isPresented: $alert) {
            
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton:
                .default(Text("OK")))
        }
    }
}

struct LoginPage : View {
    
    @State var code = ""
    @State var no = ""
    @Binding var show : Bool
    @Binding var ID : String
    @State var msg = ""
    @State var alert = false
    
    var body : some View {
        
        ZStack(alignment: .topLeading) {
            
            GeometryReader {_ in
                
                VStack(spacing : 20) {
                    
                    Image("logo") //doesn't work, why?
                    
                    Text("Verification Code").font(.largeTitle).fontWeight(.heavy)
                    
                    Text("Please Enter The Verification Code")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 12)

                    TextField("Code", text: self.$code)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color("Color"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 15)
                    
                    Button(action: {
                        
                        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                        
                        Auth.auth().signIn(with: credential) { (res, err) in
                            
                            if err != nil {
                                
                                self.msg = (err?.localizedDescription)!
                                self.alert.toggle()
                                return
                                
                            }
                            
                            UserDefaults.standard.set(true, forKey: "status")
                            
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                        
                    }) {
                        
                        Text("Verify").frame(width: UIScreen.main.bounds.width - 30, height: 50 )
                    }.foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                }
                
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "chevron.left").font(.title)
            }.foregroundColor(.blue)
            
        }
        .padding()
        .alert(isPresented: $alert) {
            
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton:
                .default(Text("OK")))
        }
    }
}

struct Home : View {
    
    @State var index = 0
    
    var body : some View {
        
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
            
                Button(action: {
                    
                    try! Auth.auth().signOut()
                    
                    UserDefaults.standard.set(false, forKey: "status")
                    
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    
                }) {
                    
                    Text("Logout")
                }
            
            }.edgesIgnoringSafeArea(.bottom)
            
            
            
        }
    }

