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
    var image: String
    var participants: Int
    var fbId: String
    // var participants: Platzhalter -> Participant Array
    var title: String
    var visibility: String
    var time: Int
    var instructions: String
    // var author: Platzhalter -> User Object
    var entry: [entry]
    // var ranking: Platzhalter -> Ranking Object
}
