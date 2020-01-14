//
//  HoroscopeViewController.swift
//  UserDefaultsLab
//
//  Created by casandra grullon on 1/13/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class HoroscopeDetailsVC: UIViewController {
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var keywordsLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    
    var horoscope: Horoscope?
    
    var currentZodiac = ZodiacSign.aries {
        didSet{
            UserPreference.shared.updateZodiac(with: currentZodiac)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateUI() {
        if let sunSign = UserPreference.shared.getUserZodiac() {
            currentZodiac = sunSign
        }
        HoroscopeAPIClient.getHoroscope(for: , completion: <#T##(Result<Horoscope, AppError>) -> ()#>)
        
    }
    

    

}
