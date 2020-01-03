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


struct ActivityRow: View {
    var name: String

    var body: some View {
        Text("Activity \(name)")
    }
}

struct ActivityView: View {
    
    var body: some View {
        NavigationView {
            List {
                ActivityRow(name: "1")
                ActivityRow(name: "2")
                ActivityRow(name: "3")
                ActivityRow(name: "4")
                ActivityRow(name: "5")
                ActivityRow(name: "6")
                ActivityRow(name: "7")
                ActivityRow(name: "8")
                ActivityRow(name: "9")
            }.navigationBarTitle("Activity")
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}


    


