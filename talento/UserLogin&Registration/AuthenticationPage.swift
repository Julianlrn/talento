//
//  AuthenticationPage.swift
//  talento
//
//  Created by Hedi Ajimi on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI
import FirebaseFirestore
import FirebaseStorage

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
                    
                    //remove this when testing with real phone numbers
                    //Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                    
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
