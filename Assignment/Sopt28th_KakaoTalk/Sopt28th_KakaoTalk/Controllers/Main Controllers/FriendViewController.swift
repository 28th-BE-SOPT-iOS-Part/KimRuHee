//
//  FriendViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit
import SnapKit

class FriendViewController: UIViewController {

    //MARK: - Properties
    
    var friendTableViewCell = FriendTableViewCell()
    
    var friendList : [FriendListDataModel] = []
    
    @IBOutlet weak var upperView: UIView!
    
    let tableView = UITableView()
    
    let header : UIView = {
        let view = UIView()
        view.frame.size.height = 73
        return view
    }()
    
    let profileButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "friendtabProfileImg"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(profileButtonTapped(_ :)), for: .touchUpInside)
        return button
    }()
    
    let myNameLabel : UILabel = {
        let label = UILabel()
        label.text = "루키루키마슈퍼루키루키루키"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 0.025, green: 0.025, blue: 0.025, alpha: 1.0)
        return label
    }()
    
    let myStatusLabel : UILabel = {
        let label = UILabel()
        label.text = "맞지맞지 그 느낌적인 느낌느낌!"
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.regular)
        label.textColor = UIColor(white: 166.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let lineView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 247.0 / 255.0, alpha: 1.0)
        return view
    }()
    

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setFriendList()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(tableView)
        header.addSubview(profileButton)
        header.addSubview(myNameLabel)
        header.addSubview(myStatusLabel)
        header.addSubview(lineView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: "FriendTableViewCell")
        
        tableView.separatorStyle = .none
        tableView.tableHeaderView = header
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(upperView.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            $0.bottom.equalTo(view.snp.bottom)
            $0.trailing.equalTo(view.snp.trailing)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(header.snp.top).offset(5)
            $0.leading.equalTo(header.snp.leading).offset(14)
            $0.bottom.equalTo(header.snp.bottom).offset(-10)
        }
        
        myNameLabel.snp.makeConstraints {
            $0.top.equalTo(header.snp.top).offset(15)
            $0.leading.equalTo(profileButton.snp.trailing).offset(10)
        }
        
        myStatusLabel.snp.makeConstraints {
            $0.top.equalTo(myNameLabel.snp.bottom).offset(7)
            $0.leading.equalTo(profileButton.snp.trailing).offset(11)
        }
         
        lineView.snp.makeConstraints {
            $0.leading.equalTo(header.snp.leading).offset(16)
            $0.bottom.equalTo(header.snp.bottom).offset(-1)
            $0.trailing.equalTo(header.snp.trailing).offset(-16)
            $0.height.equalTo(1)
        }
    }
    
    func setFriendList() {
        friendList.append(contentsOf: [
            FriendListDataModel(profileImageName: "profileImage1", name: "깨깨오예지윤", status: "찬란한 조또시도~"),
            FriendListDataModel(profileImageName: "profileImage2", name: "기버미", status: "아쥬 지갸와~"),
            FriendListDataModel(profileImageName: "profileImage3", name: "헬로씨월드", status: "이 어둠을 밝혀주는~"),
            FriendListDataModel(profileImageName: "profileImage4", name: "현시기", status: "레레레 레드코!"),
            FriendListDataModel(profileImageName: "profileImage5", name: "이창호 본부장", status: "나 장난하는 거 아닙니다."),
            FriendListDataModel(profileImageName: "profileImage6", name: "한울버린탬버린", status: "허리가 아플 땐 물리치료,, 근데 한 이틀 가도라^^"),
            FriendListDataModel(profileImageName: "profileImage7", name: "익버미", status: "구글 본부장 : 세바스찬 머시깽이 파크"),
            FriendListDataModel(profileImageName: "profileImage8", name: "제이호", status: "하이 에이치아이~"),
            FriendListDataModel(profileImageName: "profileImage9", name: "만정", status: "스위치가 있다면, 다... 꺼버릴 거야..."),
            FriendListDataModel(profileImageName: "profileImage10", name: "과거의 나", status: "도망쳐 인생에서 도망쳐!!")
        ])
    }
    
    @objc func profileButtonTapped(_ sender: UIButton!) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController")
                as? MyProfileViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        
        nextVC.name = myNameLabel.text ?? "루키루키마슈퍼루키루키루키"
        nextVC.imageName = "friendtabProfileImg"
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // ActionSheet 메뉴
    @IBAction func settingButtonTapped(_ sender: Any) {
        let alert = UIAlertController()
        let edit = UIAlertAction(title: "편집", style: .default) { (action) in
            print("편집 메뉴 선택")
        }
        
        let manage = UIAlertAction(title: "친구 관리", style: .default) { (action) in
            print("친구 관리 메뉴 선택")
        }
        
        let setting = UIAlertAction(title: "전체 설정", style: .default) { (action) in
            print("전체 설정 메뉴 선택")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(edit)
        alert.addAction(manage)
        alert.addAction(setting)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}

//MARK: - UITableViewDelegate

extension FriendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController") as? MyProfileViewController
        else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        
        // 셀 선택 시 데이터 전달
        nextVC.name = friendList[indexPath.row].name
        nextVC.imageName = friendList[indexPath.row].profileImageName

        self.present(nextVC, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource

extension FriendViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell
        else { return UITableViewCell() }
        
        cell.setData(profileImageName: friendList[indexPath.row].profileImageName,
                     name: friendList[indexPath.row].name,
                     statusMessage: friendList[indexPath.row].status)
        
        return cell
    }
    
    
    // 스와이핑 - 숨김 / 차단 메뉴
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let block = UIContextualAction(style: .normal, title: "차단")
        { (UIContextualAction, UIView, success:(Bool) -> Void) in
            success(true)
        }
        
        let hide = UIContextualAction(style: .normal, title: "숨김")
        { (UIContextualAction, UIView, success:(Bool) -> Void) in
            success(true)
        }
        
        block.backgroundColor = .red
        hide.backgroundColor = .lightGray
        
        return UISwipeActionsConfiguration(actions: [block, hide])
    }
    
    
    // 프로필 미리보기 기능
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil) { () -> UIViewController? in
            
            let preview = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as? MyProfileViewController
            preview?.imageName = self.friendList[indexPath.row].profileImageName
            preview?.name = self.friendList[indexPath.row].name
            
            return preview
            
        } actionProvider: { (_: [UIMenuElement]) -> UIMenu? in
                
            var children : [UIMenuElement] = []
            
            let btn1 = UIAction(title: "채팅하기") { (UIAction) in
                print("채팅하기 클릭됨")
            }
            
            let btn2 = UIAction(title: "보이스톡") { (UIAction) in
                print("보이스톡 클릭됨")
            }
            
            let btn3 = UIAction(title: "페이스톡") { (UIAction) in
                print("페이스톡 클릭됨")
            }
            
            let btn4 = UIAction(title: "선물하기") { (UIAction) in
                print("선물하기 클릭됨")
            }
            
            children.append(btn1)
            children.append(btn2)
            children.append(btn3)
            children.append(btn4)
            
            return UIMenu(children: children)
        }
  
    }
    
}
