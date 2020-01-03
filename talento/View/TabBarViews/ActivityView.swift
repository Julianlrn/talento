//
//  ActivityView.swift
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

struct ActivityView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Activity")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top, 16)
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}


    


