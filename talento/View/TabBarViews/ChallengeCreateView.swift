//
//  ChallengeCreateView.swift
//  talento
//
//  Created by Gökay Inan on 04.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI

struct ChallengeCreateView: View {
    
    @State var description = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter some text", text: $description)
                    .border(Color.black)
                
                Button(action: {
                    
                }) {
                    Text("Submit")
                }
                
            }
            .padding()
            .font(.title)
        }.navigationBarTitle("Create Challenge")
    }
}

struct ChallengeCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCreateView()
    }
}
