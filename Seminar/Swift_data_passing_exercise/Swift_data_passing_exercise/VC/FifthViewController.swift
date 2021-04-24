//
//  FifthViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2021/04/19.
//  Copyright © 2021 송지훈. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    static let identifier : String = FifthViewController.classStaticName
    // identifier는 VC 인스턴스 정의할 때 사용되는 부분입니다. 데이터 전달과 관련 X

    @IBOutlet weak var dataTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendButtonClicked(_ sender: Any) {

        if dataTextField.hasText{
            NotificationCenter.default.post(name: NSNotification.Name("testNoti"), object: dataTextField.text!)
        }
        self.navigationController?.popViewController(animated: true)
    
    }
}



