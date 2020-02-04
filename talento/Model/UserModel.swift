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

struct User: Identifiable {
    var id : String
    var name: String
    var image: String
    var bio: String
    var challenges: [Challenge.ID]
    var followers: [User.ID]
    var followed: [User.ID]
    var latitude: Double
    var longitude: Double
    var talentPoints: Double
}
