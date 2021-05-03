//
//  FriendTableViewCell.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/27.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusMessageLabel)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        profileImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 11).isActive = true
        
        statusMessageLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 11).isActive = true
        statusMessageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11).isActive = true
        
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

    
}
