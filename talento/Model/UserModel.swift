//
//  UserModel.swift
//  talento
//
//  Created by Julian Lorenz on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseUI

struct User: Identifiable {
    var id : String
    var name: String
    var image: String
    var bio: String
    var challenges: [Challenge]
    var followers: [User]
    var followed: [User]
    var latitude: Double
    var longitute: Double
    var talentPoints: Double

}
