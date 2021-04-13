//
//  SecondViewController.swift
//  Sopt28_1st_Seminar
//
//  Created by 김루희 on 2021/04/03.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabel()
    }
    
    
    func setLabel() {
        if let msg = self.message {
            messageLabel.text = msg
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
//        dismiss는 modal 뷰에만 해당되는 메소드
//        self.dismiss(animated: true, completion: nil)
    }
    


}
