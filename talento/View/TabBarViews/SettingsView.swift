//
//  SettingsView.swift
//  talento
//
//  Created by Gökay Inan on 24.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI


struct SettingsView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    //Text("Welcome \(UserDefaults.standard.value(forKey: "UserName") as! String)")
                    
                    Button(action: {
                                   
                        try! Auth.auth().signOut()

                        UserDefaults.standard.set(false, forKey: "status")

                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)

                    }) {

                        Text("Logout")
                    }
                }
            }.navigationBarTitle(Text("Settings"))
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
