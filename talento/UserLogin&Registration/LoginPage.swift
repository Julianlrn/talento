//
//  LoginPage.swift
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



struct LoginPage : View {
    
    @State var code = ""
    @State var no = ""
    @Binding var show : Bool
    @Binding var ID : String
    @State var msg = ""
    @State var alert = false
    @State var creation = false
    @State var loading = false
    
    var body : some View {
        Background{
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
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), lineWidth: 2)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.top, 16)
                        
                        if self.loading {
                            
                            HStack {
                                
                                Spacer()
                                
                                Indicator()
                                
                                Spacer()
                            }
                        }
                        else {
                            
                            Button(action: {
                                
                                self.loading.toggle()
                                
                                let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                                
                                Auth.auth().signIn(with: credential) { (res, err) in
                                    
                                    if err != nil {
                                        
                                        self.msg = (err?.localizedDescription)!
                                        self.alert.toggle()
                                        self.loading.toggle()
                                        return
                                        
                                    }
                                    
                                    checkUser { (exists, user) in
                                        
                                        if exists {
                                            
                                            UserDefaults.standard.set(true, forKey: "status")
                                            
                                            UserDefaults.standard.set("user", forKey: "UserName")
                                            
                                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                        }
                                        else {
                                            
                                            self.loading.toggle()
                                            self.creation.toggle()
                                        }
                                    }
                                    
                                }
                                
                            }) {
                                
                                Text("Verify")
                                    .fontWeight(.bold)
                                    .padding(16)
                            }
                            .frame(width: UIScreen.main.bounds.width - 32)
                            .foregroundColor(.white)
                            .background(Color.init(red:0.96, green:0.11, blue:0.34))
                            .cornerRadius(16)
                            .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                            
                        }
                        
                    }
                    
                }
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image(systemName: "chevron.left").font(.title)
                }.foregroundColor(.blue)
                
            }
            .padding()
            .navigationBarTitle("Login")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: self.$alert) {
                
                Alert(title: Text("Error"), message: Text(self.msg), dismissButton:
                    .default(Text("OK")))
            }
            .sheet(isPresented: self.$creation) {
                AccountCreation(show: self.$creation)
            }
        }.onTapGesture {
            self.endEditing(true)
        }
    }
    
    
    private func endEditing(_ force: Bool) {
             UIApplication.shared.endEditing()
         }

}

func checkUser(completion: @escaping (Bool, String) -> Void){
    
    let db = Firestore.firestore()
    
    db.collection("users").getDocuments { (snap, err) in
        
        if err != nil {
            
            print((err?.localizedDescription)!)
            return
        }
        
        for i in snap!.documents{
             
            if i.documentID == Auth.auth().currentUser?.uid {
                
                completion(true, i.get("name") as! String)
                return
            }
        }
        
        completion(false, "")
    }
    
}
