//
//  GeneralView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase



struct GeneralView: View {
    
    var challenge: Challenge
    @ObservedObject var imageLoader: ImageLoader
    @State var isShowPicker: Bool = false
    @State var isShowPicker2: Bool = true
    @State var image: Image? = Image("placeholder")
    @State var imageUrl : String? = ""
    @State var isSourceTypeforPicker : Int = 1
    @State var buttonText = "Participate"
    @State var uploadLabel = ""
    @State var entryID = ""

    
    
    @ObservedObject var userList = UserList()
     let db = Firestore.firestore()
   
    
    func uploadChallengeEntry(challengeId: String){
        
        if let currentUser = userList.getCurrentUser(){
        
        let challengeId = challengeId
        if (uploadLabel == ""){
        let db = Firestore.firestore()
        db.collection("challenge-entry")
            .document()
            .setData(
                // TODO: add id to challenge and add user ID
            ["image": self.imageUrl!, "id":challengeId, "likes": 0,"author": currentUser.id ]) { (err) in
                
                if err != nil{
                   
                    print((err?.localizedDescription)!)
                    return
                }}
        }  else {
                return
            }
        }
    }
    
    
    var body:  some View {
        if let author: User = getAuthor(), let currentUser = userList.getCurrentUser(){
            return AnyView(
                GeometryReader { geo in
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading) {
                             //MARK: - CARD
                             VStack {
                                 //MARK: - IMAGE
                                Image(uiImage: self.imageLoader.data != nil ? UIImage(data: self.imageLoader.data!)! :UIImage())
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width: geo.size.width)
                                 .overlay(
                                     HStack {
                                         Spacer()
                                         //MARK: - HOT
                                         VStack {
                                             Text("HOT")
                                                 .font(.system(size: 12))
                                                 .foregroundColor(Color.red)
                                                 .padding(.trailing, 16)
                                                 .padding(.leading, 16)
                                                 .padding(.top, 8)
                                                 .padding(.bottom, 8)
                                                 .background(Color.white)
                                                 .cornerRadius(16)
                                             Spacer()
                                         }
                                         .padding(.top, 16)
                                         .padding(.trailing, 16)
                                     }
                                 )
                                 
                                 //MARK: - CONTENT
                                 VStack(alignment: .leading, spacing: 24) {
                                     
                                     //MARK: - PARTICIPANTS
                                    Text("Participants: \(self.challenge.participants.count)")
                                         .font(.system(size: 16))
                                         .padding(.top, 16)
                                     
                                     //MARK: - TITLE
                                    Text(self.challenge.title)
                                         .font(.system(size: 20, weight: .bold))
                                     //MARK: - PROPERTIES
                                     HStack {
                                         HStack {
                                             Image(systemName: "globe")
                                            if self.challenge.isPublic ?? false {
                                                Text("Public")
                                            }
                                            else { Text("Local") }
                                         }
                                         Spacer()
                                         HStack {
                                             if self.challenge.challengeEnded() {
                                                 Text(self.challenge.getTimeLeft())
                                                     .foregroundColor(Color.red)
                                             } else {
                                                 Image(systemName: "timer")
                                                 Text(self.challenge.getTimeLeft())
                                             }
                                         }
                                         .padding(.trailing, 24)
                                     }
                                     .font(.footnote)
                                     .foregroundColor(Color.gray)
                                 }
                                 .padding(.leading, 24)
                                 .padding(.top, 12)
                                 .padding(.bottom, 24)
                             }
                             .background(Color.white)
                             .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.12), radius: 1, x: 0, y: 1)
                             .padding(.bottom, 24)
                             
                             VStack(alignment: .leading, spacing: 16) {
                                 Text("Author")
                                     .font(.title)
                                
                                    HStack(spacing: 8) {
                                          ProfilePictureView(currentUser: author)
                                           .frame(width:48, height: 48)
                                           .clipped()
                                           .colorMultiply(Color.init(red:0.96, green:0.11, blue:0.34, opacity: 1))
                                          .clipShape(Circle())
                                  NavigationLink(destination: ForeignProfileView(profileUser: author)) {
                                          Text(author.name).bold()
                                       }
                                       
                                }.padding(.bottom, 16)
                                
                                 
                                 Text("Instructions")
                                     .font(.title)
                                Text(self.challenge.instructions)
                                     .font(.system(size: 20))
                                
                                
                                if self.challenge.challengeEnded() {
                                    Text("No participation possible")
                                        .font(.title)
                                        .padding()
                                } else {
                                    
                                    self.image?
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(16)
                                        .frame(width: geo.size.width-32)
                                    
                                    
                                    Text(self.uploadLabel)
                                        .font(.system(size: 20))
                                    
                                    Button(action: {
                                        if (self.isShowPicker2){
                                            
                                       self.isShowPicker.toggle()
                                        print("Participate tapped!")
                                            self.isShowPicker2 = false
                                            self.buttonText = "Upload Picture"
                                        return
                                        }else{
                                            print("Upload tapped!")
                                            self.uploadChallengeEntry(challengeId: self.challenge.fbId)
                                            self.uploadLabel = "Picture was Uploaded! Good Luck in the Challenge"
                                            var challenge2: Challenge = self.challenge
                                            challenge2.participants.append(currentUser.id)
                                            self.db.collection("challenges").document(self.challenge.id).updateData(["participants" : challenge2.participants])
                                        
                                        return
                                        }
                                    }) {
                                        HStack {
                                            Text(self.buttonText)
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .padding(16)
                                        }
                                        .frame(width: geo.size.width-32)
                                        .background(self.isShowPicker2 == true ? Color.init(red:0.96, green:0.11, blue:0.34) : Color.init(red:0.05, green:0.68, blue:0.41))
                                        .cornerRadius(16)
                                        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                                        .padding(.bottom, 24)
                                                                        }
                                                                    }

                                                                 }
                                                                
                                                                .padding(.horizontal, 16)
                                                            }
                        .sheet(isPresented: self.$isShowPicker){ ImagePicker(image: self.$image, imageUrl: self.$imageUrl, sourceTypeforPicker: self.$isSourceTypeforPicker)}
                                                                 .padding(.top, 16).navigationBarTitle("Challenge")
                                                        }
                    }
                                                    )
                                            }
                                            else {
                                                return AnyView(VStack(alignment: .leading){Spacer();Text("Loading").font(.title);Spacer()}.frame(width: UIScreen.main.bounds.width))
                                            }
                                        }


    
    func getAuthor() -> User?{
     var author: User?
        if userList.userData.count != 0 {
           for item in userList.userData {
                if item.id == challenge.author{
                    author = item
                   return author
                }
            }
            
         }
        return author
    }
}
