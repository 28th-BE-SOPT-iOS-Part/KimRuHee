//
//  CompleteViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/05.
//

import UIKit

class CompleteViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var comment : String?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        
    }
    
    //MARK: - Helpers
    
    func setLabel() {
        if let cmt = self.comment {
            commentLabel.text = "\(cmt)님\n가입이 완료되었습니다."
        }
    }
    
    @IBAction func checkButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
