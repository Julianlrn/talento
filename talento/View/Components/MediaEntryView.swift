//
//  EntryView.swift
//  talento
//
//  Created by Gökay Inan on 20.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import SDWebImage

struct MediaEntryView: View {

    @ObservedObject var userList = UserList()
    @ObservedObject var obser: observer
    @State var liked = 0
    @State var disliked = 0
    let challenge: Challenge
    // @ObservedObject var imageLoader: ImageLoader = ImageLoader(urlString: item.image)
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                if self.challenge.isEnded == true {
                    Text("Challenge already ended!")
                        .font(.title)
                } else if self.userList.getCurrentUser() == nil {
                    Text("Loading")
                }
                else {
                    ForEach(self.obser.entries.filter { !$0.ratedUser.contains(self.userList.getCurrentUser()!.id)}) { item in
                        
                        MediaEntryPictureView(entry: item)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 343, height: geo.size.height)
                            .cornerRadius(16)
                            .overlay(Rectangle().frame(width: 343, height: geo.size.height).foregroundColor(self.liked == 1 ? Color.init(red:0.27, green:0.62, blue:0.27, opacity: 0.65) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0)).cornerRadius(16))
                            .overlay(Rectangle().frame(width: 343, height: geo.size.height).foregroundColor(self.disliked == 1 ? Color.init(red:0.96, green:0.11, blue:0.34, opacity: 0.65) : Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0)).cornerRadius(16))
                            .padding(.horizontal, 16)
                            .gesture(DragGesture()
                                .onChanged({ (value) in
                                    if value.translation.width > 0 {
                                        self.obser.update(id: item, value: value.translation.width, degree: 8)
                                        self.liked = 1
                                    }
                                    else {
                                        self.obser.update(id: item, value: value.translation.width, degree: -8)
                                        self.disliked = 1
                                    }
                                    
                                }).onEnded({ (value) in
                                    if let currentUser = self.userList.getCurrentUser() {
                                        if item.swipe > 0 {
                                            if item.swipe > geo.size.width / 2 - 80 {
                                                self.obser.update(id: item, value: 500, degree: 0)
                                                self.liked = 0
                                                self.obser.like(id: item)
                                                self.obser.addUser(entryId: item, userId: currentUser)
                                                print("LIKE ERFOLGREICH")
                                            }
                                            else {
                                                self.obser.update(id: item, value: 0, degree: 0)
                                                self.liked = 0
                                                self.disliked = 0
                                            }
                                        }
                                        else {
                                            if -item.swipe > geo.size.width / 2 - 80 {
                                                self.obser.update(id: item, value: -500, degree: 0)
                                                self.disliked = 0
                                                self.obser.addUser(entryId: item, userId: currentUser)
                                            }
                                            else {
                                                self.obser.update(id: item, value: 0, degree: 0)
                                                self.liked = 0
                                                self.disliked = 0
                                            }
                                        }
                                    }
                                })
                            )
                            .offset(x: item.swipe)
                            .rotationEffect(.init(degrees: item.degree))
                            .animation(.spring())
                    }
                }
            }
        }
    }
}

struct Loader : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
        
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
    }
}
