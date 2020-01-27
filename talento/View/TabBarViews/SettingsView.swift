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
                    
                    HStack(spacing: 4) {
                        Text("Logged in as")
                            .font(.system(size: 20))
                        Text(" \(UserDefaults.standard.value(forKey: "UserName") as! String)")
                            .font(.system(size: 20, weight: .bold))
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 16)
                    
                    Button(action: {
                                   
                        try! Auth.auth().signOut()

                        UserDefaults.standard.set(false, forKey: "status")

                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)

                    }) {

                        Text("Logout")
                            .fontWeight(.bold)
                            .padding(16)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .foregroundColor(.white)
                    .background(Color.init(red:0.96, green:0.11, blue:0.34))
                    .cornerRadius(16)
                    .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
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
