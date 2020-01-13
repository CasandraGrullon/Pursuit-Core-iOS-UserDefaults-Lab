//
//  UserPreferences.swift
//  UserDefaultsLab
//
//  Created by casandra grullon on 1/13/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation

enum ZodiacSign: String {
    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagittarius = "Sagittarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"
}

enum BirthdayMonth {
    case january(Int = 1)
    case february(Int)
    case march(Int)
    case april(Int)
    case may(Int)
    case june(Int)
    case july(Int)
    case august(Int)
    case september(Int)
    case october(Int)
    case november(Int)
    case december(Int)
}

struct UserPreferenceKey {
    static let zodiacSign = "Zodiac Sign"
    static let birthMonth = "Birth Month"
}

class UserPreference {
    
    private init() {}
    
    static let shared = UserPreference()
    
    func assignZodiacToBirthday(for month: BirthdayMonth, for day: Int) -> ZodiacSign {
        var zodiacSign = String()
        
//        switch month {
//        case .january(1):
//            if day ==
//        }
    }
    
}
