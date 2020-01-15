//
//  ActivityEntry.swift
//  talento
//
//  Created by Julian Lorenz on 11.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI

struct ActivityEntryView: View {
    
    var challenge: Challenge
    
    //var text : Text
    
    var body: some View {
        
            HStack {
               
                HStack(spacing: 16) {
                        
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                       
                            Text("3 hours ago")
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)
                      
                    }
                 Spacer()
                }
                .padding(12)
                .frame(minWidth: 343)
                .background(Color.init(red: 0.00, green: 0.00, blue: 0.00, opacity: 0.06))
                .cornerRadius(16)
      
    }
}


