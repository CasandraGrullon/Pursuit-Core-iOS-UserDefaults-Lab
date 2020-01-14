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

    @IBOutlet weak var zodiacSignPicker: UIPickerView!
    
    var zodiacSign = [ZodiacSign]() {
        didSet{
            DispatchQueue.main.async {
                self.zodiacSignPicker.reloadAllComponents()
                
            }
        }
    }
    
    var userName = "" {
        didSet{
            nameText.text = userName
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self
        zodiacSignPicker.delegate = self
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName = textField.text ?? "loser"
        textField.resignFirstResponder()
        return true
    }
}
extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zodiacSign[row].rawValue
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return zodiacSign.count
    }
}
