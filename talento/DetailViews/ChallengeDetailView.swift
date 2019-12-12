//
//  ChallengeDetailView.swift
//  talento
//
//  Created by Julian Lorenz on 12.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI
import SlidingTabView



struct ChallengeDetailView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        VStack(alignment:.leading){
            SlidingTabView(selection: self.$selectedTabIndex, tabs: ["General", "Rating", "Ranking"])
            (selectedTabIndex == 0 ? Text("General") : Text("Rating") ).padding()
            Spacer()
        }.padding(.top, 50)
            .border(Color.white)
       
        
          //  .animation(.none)

    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView()
    }
}


    


