//
//  AccountCreation.swift
//  talento
//
//  Created by Hedi Ajimi on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct AccountCreation : View {
    
    @State var name = ""
    @State var bio = ""
    @State var imagedata : Data = .init(count: 0)
    
    @Binding var show : Bool
    @State var picker = false
    @State var loading = false
    @State var alert = false
    
    
    var body : some View {
        Background{
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Create an Account").font(.title)
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.picker.toggle()
                        
                    }) {
                        
                        if self.imagedata.count == 0 {
                            
                            Image(systemName: "person.crop.circle.badge.plus")
                                .resizable()
                                .frame(width: 90, height: 70)
                                .foregroundColor(.gray)
                            
                        }
                        else {
                            
                            Image(uiImage: UIImage(data: self.imagedata)!)
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.vertical, 16)
                
                Text("Enter User Name")
                                   .font(.body)
                                   .foregroundColor(.gray)
                                   .padding(.top, 12)

                TextField("Name", text: self.$name){
                    self.endEditing(true)
                }
                   //.keyboardType(.numberPad)
                   .padding()
                   .background(Color.white)
                   .overlay(
                       RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), lineWidth: 2)
                   )
                   .clipShape(RoundedRectangle(cornerRadius: 16))
                   .padding(.top, 16)
                
                Text("About You")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .padding(.top, 12)

                TextField("About You", text: self.$bio){
                    self.endEditing(true)

                }
                    //.keyboardType(.numberPad)
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
                else{
                                 
                    Button(action: {
                        
                        if self.name != "" && self.bio != "" && self.imagedata.count != 0{
                            
                            self.loading.toggle()
                            CreateUser(name: self.name, bio: self.bio, imagedata: self.imagedata) { (status) in
                                
                                if status{
                                    
                                    self.show.toggle()
                                }
                            }
                        }
                        else{
                            
                            self.alert.toggle()
                        }
                        
                        
                    }) {
                        

                    Text("Create")
                        .padding(16)
                             
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .foregroundColor(.white)
                    .background(Color.init(red:0.96, green:0.11, blue:0.34))
                    .cornerRadius(16)
                    .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                    
                }
                
            }
            .padding()
            .sheet(isPresented: self.$picker, content: {
                
                RegistrationImagePicker(picker: self.$picker, imagedata: self.$imagedata)
            })
            .alert(isPresented: self.$alert) {
                
                Alert(title: Text("Message"), message: Text("Please Fill The Contents"), dismissButton: .default(Text("Ok")))
            }
        }.onTapGesture {
            self.endEditing(true)
        }
    }
    
    private func endEditing(_ force: Bool) {
                UIApplication.shared.endEditing()
            }
}
