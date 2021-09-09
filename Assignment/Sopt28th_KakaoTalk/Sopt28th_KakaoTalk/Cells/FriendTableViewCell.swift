//
//  FriendTableViewCell.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/27.
//

import UIKit
import SnapKit

protocol MyCustomDelegate {
    func clickCustomButton(index: Int)
}

class FriendTableViewCell: UITableViewCell {
    static let identifier = "FriendTableViewCell"
    
    // MARK: - Properties
    var index: Int = 0
    var mydelegate: MyCustomDelegate?

    var profileImage = UIImageView()
    
    var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 0.025, green: 0.025, blue: 0.025, alpha: 1.0)
        return label
    }()
    
    var statusMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.regular)
        label.textColor = UIColor(white: 166.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    var customButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "shopTabIcon"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusMessageLabel)
        contentView.addSubview(customButton)
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(4)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(profileImage.snp.trailing).offset(11)
        }
        
        statusMessageLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImage.snp.trailing).offset(11)
            make.bottom.equalTo(contentView.snp.bottom).offset(-11)
        }
        
        customButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        self.customButton.addTarget(self, action: #selector(touchupCustomButton(_:)), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(profileImageName : String,
                 name : String,
                 statusMessage : String) {
        
        if let image = UIImage(named: profileImageName) {
            profileImage.image = image
        }
        nameLabel.text = name
        statusMessageLabel.text = statusMessage
        
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - @objc
    @objc func touchupCustomButton(_ sender: UIButton) {
        mydelegate?.clickCustomButton(index: index)
    }
}
