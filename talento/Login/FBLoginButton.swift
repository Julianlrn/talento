//
//  FBLoginButton.swift
//  talento
//
//  Created by Julian Lorenz on 09.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import FBSDKLoginKit
import Firebase
import FirebaseUI

struct login : UIViewRepresentable{

    func makeCoordinator() -> login.Coordinator {
        return login.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<login>) -> FBLoginButton {
        let button = FBLoginButton()
        button.permissions = ["email"]
        button.delegate = context.coordinator
        return button
    }
    
    func updateUIView(_ uiView:FBLoginButton, context: UIViewRepresentableContext<login>) {
        
    }
    
    class Coordinator : NSObject,LoginButtonDelegate{
        
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            
            if error != nil{
            
                print((error?.localizedDescription)!)
                return
            }
            
            if AccessToken.current != nil {
                
                let credential = FacebookAuthProvider.credential(withAccessToken:AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential) { (res, er) in
                    
                    if error != nil{
                    
                        print((error?.localizedDescription)!)
                        return
                    }
                
                    print("success")
                    (UIApplication.shared.connectedScenes.first!.delegate! as! SceneDelegate).loginCheck.logIn()
                    
                   
                }
                
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            
            try! Auth.auth().signOut()
            (UIApplication.shared.connectedScenes.first!.delegate! as! SceneDelegate).loginCheck.loggedIn = false
            
        }
    }
}
