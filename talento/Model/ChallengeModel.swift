//
//  ChallengeModel.swift
//  talento
//
//  Created by Gökay Inan on 03.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct Challenge: Identifiable {
    var id = UUID()
    var fbId: String
    var image: String
    var participants: Int
    var title: String
    var visibility: String
    var time: Int
    var instructions: String
    // var author: Platzhalter -> Author Object
    // var entries: Platzhalter -> Rating Object
    // var ranking: Platzhalter -> Ranking Object
}
