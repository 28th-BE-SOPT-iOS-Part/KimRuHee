//
//  ViewController.swift
//  Sopt28_1st_Seminar
//
//  Created by 김루희 on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.textAlignment = .center
        titleLabel.text = "변경 직전의 라벨입니다!"
        
        resultLabel.text = "결과 표시 라벨입니다."
        
        
    }


    @IBAction func changeButtonClicked(_ sender: Any) {
        titleLabel.text = "변경 완료!!"
        titleLabel.textColor = .red
        print("버튼누름")
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        if nameTextField.hasText == true && numberTextField
            .hasText == true {
            resultLabel.text = "\(nameTextField.text!)의 번호는 \(numberTextField.text!)입니다."
        } else {
            resultLabel.text = "결과 표시 라벨입니다."
        }
    }
    
}

