//
//  AccountCreation.swift
//  talento
//
//  Created by Hedi Ajimi on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct AccountCreation : View {
    
    @Binding var show : Bool
    @State var name = ""
    @State var bio = ""
    @State var picker = false
    @State var loading = false
    @State var imagedata : Data = .init(count: 0)
    @State var alert = false
    
    
    var body : some View {

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
            .padding(.vertical, 15)
            
            Text("Enter User Name")
                               .font(.body)
                               .foregroundColor(.gray)
                               .padding(.top, 12)

           TextField("Name", text: self.$name)
               .keyboardType(.numberPad)
               .padding()
               .background(Color("Color"))
               .clipShape(RoundedRectangle(cornerRadius: 10))
               .padding(.top, 15)
            
            Text("About You")
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(.top, 12)

            TextField("About You", text: self.$bio)
                .keyboardType(.numberPad)
                .padding()
                .background(Color("Color"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 15)
            
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
                    

                Text("Create").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                         
                }.foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
            }
            
        }
        .padding()
        .sheet(isPresented: self.$picker, content: {
            
            RegistrationImagePicker(picker: self.$picker, imagedata: self.$imagedata)
        })
        .alert(isPresented: self.$alert) {
            
            Alert(title: Text("Message"), message: Text("Please Fill The Contents"), dismissButton: .default(Text("Ok")))
        }
    }
}
