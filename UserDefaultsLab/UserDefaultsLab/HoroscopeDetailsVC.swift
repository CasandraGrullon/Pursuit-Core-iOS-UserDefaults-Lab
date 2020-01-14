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
    
    var currentZodiac = ZodiacSign.aries.rawValue {
        didSet{
            UserPreference.shared.updateZodiac(with: currentZodiac)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let sunSign = UserPreference.shared.getUserZodiac() {
            currentZodiac = sunSign
        }
        let horoscopeString = currentZodiac.lowercased()
        HoroscopeAPIClient.getHoroscope(for: horoscopeString) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let horoscope):
                self?.horoscope = horoscope
                DispatchQueue.main.async {
                    self?.zodiacLabel.text = horoscope.sunsign
                    self?.descriptionLabel.text = horoscope.horoscope
                    self?.moodLabel.text = horoscope.meta.mood
                    self?.keywordsLabel.text = horoscope.meta.keywords
                    self?.intensityLabel.text = horoscope.meta.intensity
                }
                
            }
        }
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else {
            fatalError("issue with unwind segue")
        }
        //currentZodiac = settingsVC.zodiacSign
    }
    
    
    
    
}
