//
//  TextFieldDelegateViewController.swift
//  Sopt28_3rd_Seminar
//
//  Created by 김루희 on 2021/04/24.
//

import UIKit

class TextFieldDelegateViewController: UIViewController {

    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleTextField.delegate = self

    }
    

    

}

// extension은 새로운 기능을 추가 + 확장하는 것을 말함,,
// extension 분리하는 것 추천

extension TextFieldDelegateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = sampleTextField.text {
            sampleLabel.text = text
        }
        return true
    }
    
}
