//
//  PostModel.swift
//  talento
//
//  Created by Gökay Inan on 28.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import Foundation

struct Post: Identifiable {
    var id : String
    var user: User.ID
    var challenge: Challenge.ID
    var timestamp: Double
}
