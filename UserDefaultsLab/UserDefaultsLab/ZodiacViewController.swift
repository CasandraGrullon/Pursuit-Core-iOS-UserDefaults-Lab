//
//  ViewController.swift
//  UserDefaultsLab
//
//  Created by casandra grullon on 1/13/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class ZodiacViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    
    var zodiacSign: Horoscope?
    
    var userName = "" {
        didSet{
            nameText.text = userName
        }
    }
    
    var userBirthday = "" {
        didSet{
            birthdayText.text = userBirthday
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self
        birthdayText.delegate = self
    }

    
    
    

}

extension ZodiacViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName = textField.text ?? "loser"
        textField.resignFirstResponder()
        return true
    }
}
