//
//  ThridViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/06.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    static let identifier : String = SecondViewController.classStaticName
    // identifier는 VC 인스턴스 정의할 때 사용되는 부분입니다. 데이터 전달과 관련 X

    
    var text : String = ""
    @IBOutlet weak var textLabel : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
