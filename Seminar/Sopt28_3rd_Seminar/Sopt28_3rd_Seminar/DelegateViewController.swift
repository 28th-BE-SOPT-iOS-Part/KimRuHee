//
//  DelegateViewController.swift
//  Sopt28_3rd_Seminar
//
//  Created by 김루희 on 2021/04/24.
//

import UIKit

protocol SampleProtocol {
    
    // 구현부는 작성하지 않음.. 왜냐면 프로토콜이기 때문에
    func dataSend(data: String)
    
}

class DelegateViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
//    var delegate : SampleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func dataSendButtonClicked(_ sender: Any) {
        
        // 텍스트필드에 텍스트가 있을 경우에만 넘겨줌
        if let text = dataTextField.text {
            
            // notification center 사용
            //  sample이라는 신호를 보냄.. text를 담아서..
            NotificationCenter.default.post(name: NSNotification.Name("sample"), object: text)
            
//            delegate 사용
//            delegate?.dataSend(data: text)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    

}
