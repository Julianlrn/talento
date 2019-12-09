//
//  LoginCheck.swift
//  talento
//
//  Created by Julian Lorenz on 09.12.19.
//  Copyright © 2019 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import FBSDKLoginKit


class LoginCheck: ObservableObject{
    @Published var loggedIn: Bool = AccessToken.current != nil
    @Published var loading: Bool = false
    
    func logIn(){
        loggedIn = true
    }
}
