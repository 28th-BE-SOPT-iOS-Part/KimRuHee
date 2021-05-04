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
    @IBOutlet weak var checkButton: UIButton!
    
    var comment : String?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.layer.cornerRadius = 5
        setLabel()
        
    }
    
    //MARK: - Helpers
    
    func setLabel() {
        if let cmt = self.comment {
            commentLabel.text = "\(cmt)님\n가입이 완료되었습니다."
        }
    }
    
    @IBAction func checkButtonTapped(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "FriendViewController") as? FriendViewController else { return }
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
