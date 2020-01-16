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
    static let userName = "User Name"
}

class UserPreference {
    
    private init() {}
    
    static let shared = UserPreference()
    
    func updateZodiac(with zodiac: ZodiacSign.RawValue) {
        UserDefaults.standard.set(zodiac, forKey: UserPreferenceKey.zodiacSign)    
    }
    
    func getUserZodiac() -> ZodiacSign.RawValue? {
        guard let zodiac = UserDefaults.standard.object(forKey: UserPreferenceKey.zodiacSign) as? String else {
            return nil
        }
        return ZodiacSign(rawValue: zodiac).map { $0.rawValue }
    }
    
    func getUserName() -> String? {
        guard let name = UserDefaults.standard.object(forKey: UserPreferenceKey.userName) as? String else {
            return nil
        }
        return name
    }
    
    func updateUserName(with name: String) {
        UserDefaults.standard.set(name, forKey: UserPreferenceKey.userName)
    }
}
