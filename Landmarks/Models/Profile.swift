//
//  Profile.swift
//  Landmarks
//
//  Created by tom montgomery on 2/12/24.
//

import Foundation

struct Profile {
    
    var userName: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(userName: "g_money")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }

}

