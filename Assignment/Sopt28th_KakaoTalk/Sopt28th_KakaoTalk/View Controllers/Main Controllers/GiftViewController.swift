//
//  GiftViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by Thisisme Hi on 2021/09/09.
//

import UIKit

import SnapKit

class GiftViewController: UIViewController {

    var text: String?
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var label2: UILabel = {
        let label = UILabel()
        label.text = "🎁"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 200)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(label)
        view.addSubview(label2)

        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        
        label2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        label.text = text
    }
}
