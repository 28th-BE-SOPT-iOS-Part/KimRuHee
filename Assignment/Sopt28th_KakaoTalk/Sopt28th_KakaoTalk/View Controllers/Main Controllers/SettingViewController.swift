//
//  SettingViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit

class SettingViewController: UIViewController {

    //MARK: - Properties
    
    var menuList = ["메일", "캘린더", "서랍", "카카오콘",
                    "메이커스", "선물하기", "이모티콘", "프렌즈",
                    "쇼핑하기", "스타일", "주문하기", "멜론티켓",
                    "게임", "멜론", "헤어샵", "전체서비스"]
    
    @IBOutlet weak var myProfileNameLabel: UILabel!
    @IBOutlet weak var myEmailLabel: UILabel!
    
    @IBOutlet weak var settingCollectionView: UICollectionView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myProfileNameLabel.text = "루키루키마슈퍼루키루키"
        myEmailLabel.text = "heerucan@sopt.org"
        
        settingCollectionView.delegate = self
        settingCollectionView.dataSource = self
    }
    
    //MARK: - Helpers
    
    @IBAction func myProfileButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        
    }
    
   

}

extension SettingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingCollectionViewCell", for: indexPath) as? SettingCollectionViewCell else { return UICollectionViewCell() }
        
        cell.menuLabel.text = menuList[indexPath.row]
        return cell
    }
    
}

extension SettingViewController: UICollectionViewDelegate {
    
}

extension SettingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (70/375)
        let cellHeight = cellWidth * (70/70)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
}
