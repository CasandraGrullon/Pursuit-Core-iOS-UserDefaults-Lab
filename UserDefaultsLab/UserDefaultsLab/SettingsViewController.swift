//
//  ViewController.swift
//  UserDefaultsLab
//
//  Created by casandra grullon on 1/13/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var pickerView: UIPickerView!
        
    var zodiacs = [ZodiacSign.aries.rawValue, ZodiacSign.taurus.rawValue, ZodiacSign.gemini.rawValue, ZodiacSign.cancer.rawValue, ZodiacSign.leo.rawValue, ZodiacSign.virgo.rawValue, ZodiacSign.libra.rawValue, ZodiacSign.scorpio.rawValue, ZodiacSign.sagittarius.rawValue, ZodiacSign.capricorn.rawValue, ZodiacSign.aquarius.rawValue, ZodiacSign.pisces.rawValue]
    
    var selectedZodiac = ZodiacSign.aries.rawValue
    
    var userName = "" {
        didSet{
            nameText.text = userName
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName = textField.text ?? "loser"
        textField.resignFirstResponder()
        return true
    }
}
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zodiacs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zodiacs[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sign = zodiacs[row]
        selectedZodiac = sign
        UserPreference.shared.updateZodiac(with: sign)
        
    }
}
