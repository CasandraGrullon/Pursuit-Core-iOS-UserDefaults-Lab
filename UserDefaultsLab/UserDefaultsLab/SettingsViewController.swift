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
    
    var zodiacSign = [ZodiacSign]() {
        didSet{
            DispatchQueue.main.async {
                
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
extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zodiacSign.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zodiacSign[row].rawValue
    }
    
}
extension SettingsViewController: UIPickerViewDelegate {
    
}
