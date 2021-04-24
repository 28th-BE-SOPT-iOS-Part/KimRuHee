//
//  SixthViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/07.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    static let identifier : String = FourthViewController.classStaticName
    // identifier는 VC 인스턴스 정의할 때 사용되는 부분입니다. 데이터 전달과 관련 X
    
    
    @IBOutlet weak var textField: UITextField!
    

    var completionHandler: ((String) -> (String))?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        _ = completionHandler?(self.textField.text ?? "")
        
        self.navigationController?.popViewController(animated: true)
    }   
    

}



