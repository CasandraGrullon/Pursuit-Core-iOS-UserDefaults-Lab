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

struct UserPreferenceKey {
    static let zodiacSign = "Zodiac Sign"
    static let birthMonth = "Birth Month"
}

class UserPreference {
    
    private init() {}
    
    static let shared = UserPreference()
    
    func updateZodiac(with zodiac: ZodiacSign) {
        UserDefaults.standard.set(zodiac.rawValue, forKey: UserPreferenceKey.zodiacSign)    
    }
    
    func getUserZodiac() -> ZodiacSign? {
        guard let zodiac = UserDefaults.standard.object(forKey: UserPreferenceKey.zodiacSign) as? String else {
            return nil
        }
        return ZodiacSign(rawValue: zodiac)
    }
}
