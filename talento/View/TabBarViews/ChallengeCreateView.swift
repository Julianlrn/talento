//
//  ChallengeCreateView.swift
//  talento
//
//  Created by Gökay Inan on 04.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseUI

struct ChallengeCreateView: View {
    
   // @ObservedObject var imageLoader: ImageLoader
    @State private var description = ""
    @State private var name = ""
    @State private var isPublic : Bool = false
    // @Published var imgName: String = ""
    @State var isShowPicker: Bool = false
    @State var image: Image? = Image("placeholder")
    @State var imageUrl : String? = ""
    @State var isSourceTypeforPicker : Int = 2
    
    let createdDate = FieldValue.serverTimestamp()
    
    @Binding var isPresented : Bool
    
    
    func upload(){
        let db = Firestore.firestore()
        db.collection("challenges")
            .document()
            .setData(
            ["title":self.name, "instructions":self.description, "image": self.imageUrl!, "isPublic":self.isPublic, "timestamp": self.createdDate, "duration": 10]) { (err) in
                
                if err != nil{
                   
                    print((err?.localizedDescription)!)
                    return
                }
        }
        
        print(self.createdDate)
    }
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                TextField("Title", text: $name)
                    .font(.system(size: 16))
                    .padding(16)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), lineWidth: 2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                TextField("Instructions", text: $description)
                    .font(.system(size: 16))
                    .padding(16)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), lineWidth: 2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Toggle(isOn: $isPublic) {
                    Text("Public")
                }

                // TODO: Image aus DB lesen und hochladen
                image?.resizable().aspectRatio(contentMode: .fit).frame(height: 150)
                  Button(action: {
                      withAnimation {
                          self.isShowPicker.toggle()
                      }
                  }) {
                    HStack {
                        Text("Import")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(16)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16))
                    .cornerRadius(16)
                    .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                    .padding(.bottom, 12)
                  }

                Button(action: {
                    self.upload()
                    self.isPresented.toggle()
                }) {
                    HStack {
                        Text("Submit")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(16)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(Color.init(red:0.96, green:0.11, blue:0.34))
                    .cornerRadius(16)
                    .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                    .padding(.bottom, 24)
                }
            }
            .sheet(isPresented: $isShowPicker){ ImagePicker(image: self.$image, imageUrl: self.$imageUrl, sourceTypeforPicker: self.$isSourceTypeforPicker)}
            .padding()
            .font(.title)
            .navigationBarTitle("Create Challenge")
        }
    }
}
