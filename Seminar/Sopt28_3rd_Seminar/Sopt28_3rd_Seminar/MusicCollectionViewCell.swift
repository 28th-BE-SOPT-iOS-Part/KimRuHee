//
//  MusicCollectionViewCell.swift
//  Sopt28_3rd_Seminar
//
//  Created by 김루희 on 2021/04/24.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    func setData(imageName: String,
                 title: String,
                 subtitle: String) {
        
        if let image = UIImage(named: imageName) {
            albumImageView.image = image
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
