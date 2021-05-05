//
//  FriendViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit
import SnapKit

protocol SelectCell {
    func sendData(data : [String : String])
}

class FriendViewController: UIViewController {

    //MARK: - Properties
    
    var delegate : SelectCell?
    
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
    
    // 여기 내 프로필이랑 친구 목록 구분선!! 부분
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
            FriendListDataModel(profileImageName: "profileImage1", name: "기버미", status: "아쥬 지갸와~"),
            FriendListDataModel(profileImageName: "profileImage1", name: "헬로씨월드", status: "이 어둠을 밝혀주는~"),
            FriendListDataModel(profileImageName: "profileImage1", name: "현시기", status: "레레레 레드코!"),
            FriendListDataModel(profileImageName: "profileImage1", name: "이창호 본부장", status: "나 장난하는 거 아닙니다."),
            FriendListDataModel(profileImageName: "profileImage1", name: "한울버린탬버린", status: "허리가 아플 땐 물리치료,, 근데 한 이틀 가도라^^"),
            FriendListDataModel(profileImageName: "profileImage1", name: "익버미", status: "구글 본부장 : 세바스찬 머시깽이 파크"),
            FriendListDataModel(profileImageName: "profileImage1", name: "제이호", status: "하이 에이치아이~"),
            FriendListDataModel(profileImageName: "profileImage1", name: "만정", status: "스위치가 있다면, 다... 꺼버릴 거야..."),
            FriendListDataModel(profileImageName: "profileImage1", name: "과거의 나", status: "도망쳐 인생에서 도망쳐!!")
        ])
    }
    
    @objc func profileButtonTapped(_ sender: UIButton!) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController")
                as? MyProfileViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
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

//MARK: - Extension

extension FriendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController") as? MyProfileViewController
        else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        
        // if let으로 데이터를 전달해줘야 하는 부분이고
        // 조건문 내부에서 delegate.sendData를 써서 구현해줘야 함
        
        self.present(nextVC, animated: true, completion: nil)
    }
}

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
    
    
    
}
