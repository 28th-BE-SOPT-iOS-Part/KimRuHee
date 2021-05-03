//
//  FriendViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit

class FriendViewController: UIViewController {

    //MARK: - Properties
    
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
        label.text = "돌이킬 수 없는 실수하지 말기로 해..."
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
//        header.translatesAutoresizingMaskIntoConstraints = false
//        header.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0).isActive = true
//        header.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: 0).isActive = true
//        header.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0).isActive = true
//        header.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: 0).isActive = true
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.topAnchor.constraint(equalTo: header.topAnchor, constant: 5).isActive = true
        profileButton.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 14).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10).isActive = true
        
        myNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myNameLabel.topAnchor.constraint(equalTo: header.topAnchor, constant: 15).isActive = true
        myNameLabel.leftAnchor.constraint(equalTo: profileButton.rightAnchor, constant: 10).isActive = true
        
        myStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        myStatusLabel.topAnchor.constraint(equalTo: myNameLabel.bottomAnchor, constant: 7).isActive = true
        myStatusLabel.leftAnchor.constraint(equalTo: profileButton.rightAnchor, constant: 11).isActive = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 16).isActive = true
        lineView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -1).isActive = true
        lineView.rightAnchor.constraint(equalTo: header.rightAnchor, constant: -16).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setFriendList() {
        friendList.append(contentsOf: [
            FriendListDataModel(profileImageName: "profileImage1", name: "깨깨오예지윤", status: "돌이킬 수 없는 강 먼저 건넌 새럼.."),
            FriendListDataModel(profileImageName: "profileImage1", name: "기버미", status: "아쥬 지갸와~"),
            FriendListDataModel(profileImageName: "profileImage1", name: "헬로씨월드", status: "스터디 쉽지 않다 나 어트카니.."),
            FriendListDataModel(profileImageName: "profileImage1", name: "현시기", status: "흙이 묻은 땅에서 막 파낸 감자"),
            FriendListDataModel(profileImageName: "profileImage1", name: "이창호 본부장", status: "나 장난하는 거 아닙니다."),
            FriendListDataModel(profileImageName: "profileImage1", name: "한울버린탬버린", status: "허리가 아플 땐 물리치료,, 근데 한 이틀 가도라^^"),
            FriendListDataModel(profileImageName: "profileImage1", name: "익버미", status: "구글 본부장 : 세바스찬 머시깽이 파크"),
            FriendListDataModel(profileImageName: "profileImage1", name: "제이호", status: "하이 에이치아이~"),
            FriendListDataModel(profileImageName: "profileImage1", name: "만정", status: "인생이 쉽지 않도라...무,,아,,요,,"),
            FriendListDataModel(profileImageName: "profileImage1", name: "과거의 나", status: "도망쳐 인생에서 도망쳐!!")
        ])
    }
    
    @objc func profileButtonTapped(_ sender: UIButton!) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController")
                as? MyProfileViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

//MARK: - Extension

extension FriendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
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
