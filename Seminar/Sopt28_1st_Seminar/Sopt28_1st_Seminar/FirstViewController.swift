//
//  FirstViewController.swift
//  Sopt28_1st_Seminar
//
//  Created by 김루희 on 2021/04/03.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeButtonClicked(_ sender: Any) {
        
        // 모달뷰 코드로 화면전환
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        nextVC.message = messageTextField.text
        self.navigationController?.pushViewController(nextVC, animated: true)
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.modalTransitionStyle = .coverVertical
//        self.present(nextVC, animated: true, completion: nil)
        
    }

}
