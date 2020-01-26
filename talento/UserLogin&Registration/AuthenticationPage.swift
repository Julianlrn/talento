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

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.white
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
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
        Background{
            VStack(spacing : 20) {
                
                Image("logo") //doesn't work, why?
                
                Text("Login with your Number").font(.largeTitle).fontWeight(.heavy)
                
                Text("Please Enter Your Number to Create an Account or Log-In")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 12)
                
                HStack {
                    
                    TextField("+1", text: self.$ccode)
                        .keyboardType(.numberPad)
                        .frame(width: 45)
                        .padding()
                        .background(Color("Color")) //doesn't work, why?
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField("Number", text: self.$no)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color("Color")) //doesn't work, why?
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }.padding(.top, 15)
                
                NavigationLink(destination: LoginPage(show: self.$show, ID: self.$ID), isActive: self.$show){
                    
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
                    .background(Color.init(red:0.96, green:0.11, blue:0.34))
                    .cornerRadius(10)
                    
                }
                

                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
            }.padding()
                .alert(isPresented: self.$alert) {
                
                Alert(title: Text("Error"), message: Text(self.msg), dismissButton:
                    .default(Text("OK")))
            }
        
        }.onTapGesture {
            self.endEditing(true)
        }
        
    }
    
    private func endEditing(_ force: Bool) {
           UIApplication.shared.endEditing()
       }

}




