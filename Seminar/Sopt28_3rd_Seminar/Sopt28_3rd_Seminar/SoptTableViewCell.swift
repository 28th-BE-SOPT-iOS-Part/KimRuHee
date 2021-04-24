//
//  SoptTableViewCell.swift
//  Sopt28_3rd_Seminar
//
//  Created by 김루희 on 2021/04/24.
//

import UIKit

class SoptTableViewCell: UITableViewCell {
    
    static let identifier : String = "SoptTableViewCell"

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(imageName: String,
                 title: String,
                 subtitle: String) {
        
        if let image = UIImage(named: imageName) {
            iconImageView.image = image
        }
        
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    

}
