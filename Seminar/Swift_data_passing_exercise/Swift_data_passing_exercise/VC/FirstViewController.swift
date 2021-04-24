//
//  SecondViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/06.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    static let identifier : String = FirstViewController.classStaticName
    // identifier는 VC 인스턴스 정의할 때 사용되는 부분입니다. 데이터 전달과 관련 X


    @IBOutlet weak var textLabel: UILabel!
    var text : String = ""
    // 여기 text 변수에 값을 전달 받을 예정입니다.
    
    let apple : String = "apple"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textLabel.text = text
        // 전달받은 text 데이터를 Label에 넣어줍니다.
    }
    

}


 
