//
//  ChallengeModel.swift
//  talento
//
//  Created by Gökay Inan on 03.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase

struct Challenge: Identifiable {
    var id : String
    var fbId: String
    var image: String
    var participants: [User.ID]
    var title: String
    var timestamp: Int
    var duration: Double
    var instructions: String
    var isPublic: Bool?
    var author: User.ID
    var latitude: Double
    var longitude: Double
    var isEnded:Bool

}
