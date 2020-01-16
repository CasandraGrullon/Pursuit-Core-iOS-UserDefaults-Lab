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
    @IBOutlet weak var imageView: UIImageView!
    
    var horoscope: Horoscope?
    
    var currentZodiac = ZodiacSign.aries.rawValue {
        didSet{
            getHoroscope()
            UserPreference.shared.updateZodiac(with: currentZodiac)
        }
    }
    
    var userName = String() {
        didSet{
            UserPreference.shared.updateUserName(with: userName)
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
        if let name = UserPreference.shared.getUserName() {
            userName = name.capitalized
        }
    }
    
    func getHoroscope(){
        HoroscopeAPIClient.getHoroscope(for: currentZodiac.lowercased()) { [weak self] (result) in
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
                    self?.userNameLabel.text = "\(self?.userName ?? "") Daily Horoscope"
                    self?.imageView.image = UIImage(named: "\(horoscope.sunsign.lowercased())")
                }
                
            }
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else {
            fatalError("issue with unwind segue")
        }
        currentZodiac = settingsVC.selectedZodiac
        userName = settingsVC.userName
    }
 
}
