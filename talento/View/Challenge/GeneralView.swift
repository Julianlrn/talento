//
//  GeneralView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI




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
    


    func upload(){
        if (uploadLabel == ""){
        let db = Firestore.firestore()
        db.collection("challenge-entry")
            .document()
            .setData(
                // TODO: add challenge und user ID
            ["image": self.imageUrl!]) { (err) in
                
                if err != nil{
                   
                    print((err?.localizedDescription)!)
                    return
                }}
        }  else {
                return
            }
        }
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                 //MARK: - CARD
                 VStack {
                     //MARK: - IMAGE
                     Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! :UIImage())
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(height: 230)
                     .clipShape(Rectangle())
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
                     .frame(maxHeight: 220)
                     
                     //MARK: - CONTENT
                     VStack(alignment: .leading, spacing: 24) {
                         
                         //MARK: - PARTICIPANTS
                        Text("Participants: \(challenge.participants.count)")
                             .font(.system(size: 16))
                             .padding(.top, 16)
                         
                         //MARK: - TITLE
                         Text(challenge.title)
                             .font(.system(size: 20, weight: .bold))
                         //MARK: - PROPERTIES
                         HStack {
                             HStack {
                                 Image(systemName: "globe")
                                if challenge.isPublic ?? false {
                                    Text("Public")
                                }
                                else { Text("Local") }
                             }
                             Spacer()
                             HStack {
                                 Image(systemName: "timer")
                                 /*Text("Created: \((challenge.timestamp.dateValue().calenderTimeSinceNow()))")*/
                                Text("Created")
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
                     HStack(spacing: 16) {
                         Image("profile")
                             .resizable()
                             .aspectRatio(contentMode: .fill)
                             .frame(width: 48, height: 48)
                             .clipShape(Circle())
                         Text("michael0301")
                             .font(.system(size: 20, weight: .bold))
                     }
                     .padding(.bottom, 16)
                     
                     Text("Instructions")
                         .font(.title)
                     Text(challenge.instructions)
                         .font(.system(size: 20))
                    image?.resizable().scaledToFit().frame(height: CGFloat(320))
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
                            self.upload()
                            self.uploadLabel = "Picture was Uploaded! Good Luck in the Challenge"
                        
                        return
                        }
                    }) {
                        HStack {
                            Text(self.buttonText)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(16)
                        }
                        .frame(width: 343)
                        .background(Color.init(red:0.96, green:0.11, blue:0.34))
                        .cornerRadius(16)
                        .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                        .padding(.bottom, 24)
                    }

                 }
                
                 .padding(.horizontal, 16)
             }
            .sheet(isPresented: $isShowPicker){ ImagePicker(image: self.$image, imageUrl: self.$imageUrl, sourceTypeforPicker: self.$isSourceTypeforPicker)}
            .padding(.top, 16)
        }
    }
}
