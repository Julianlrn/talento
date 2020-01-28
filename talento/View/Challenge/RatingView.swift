//
//  RatingView.swift
//  talento
//
//  Created by Gökay Inan on 21.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    let challenge: Challenge
    var body: some View {
      MediaEntryView(obser: observer(challenge: challenge), challenge: challenge)
    }
}

