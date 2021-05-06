### 3주차 과제의 리드미입니다 ✨


#### 📌 과제 조건

- ✅ 친구 목록 - 테이블 뷰 구현
- ✅ 친구 선택 시 데이터 패스
- ✅ 더보기 탭 - 컬렉션 뷰 구현
- ✅ 도전과제1 : ActionSheet
- ✅ 도전과제2 : TableView Swipe Menu
- ✅ 도전과제3 : Contextual Menu

<br>


### 🥳 Tada ~ 결과화면


#### 👉🏻 구현영상 ( 기본과제 - TableView  + CollectionView / 도전과제  )


<img width="30%" src="https://user-images.githubusercontent.com/63235947/117249936-62ffac00-ae7d-11eb-9c2f-7691dc70c1e6.mov"/>  &nbsp;  &nbsp; &nbsp; 
<img width="30%" src="https://user-images.githubusercontent.com/63235947/117250955-f2598f00-ae7e-11eb-8557-0b2eecc166ef.mov"/> &nbsp;  &nbsp; &nbsp; 
<img width="30%" src="https://user-images.githubusercontent.com/63235947/117250134-ba058100-ae7d-11eb-85dc-a1b5a1c20d1a.mov"/>


<br>


<hr>

### 1️⃣ 새로 알게된 점 또는 새로 시도한 것 🤩🤩🤩

#### **1. 테이블 뷰 header에는 따로 autolayout을 안줘도 된다!**

: `tableView.tableHeaderView = header`에서 tableHeaderView 프로퍼티는 따로 width값을 주지 않아도 tableView의 width값에 자동으로 맞춰진다. 그리고  height값은 줘야 한다.


```
let header : UIView = {
    let view = UIView()
    view.frame.size.height = 73 // ▶️ 이 부분이 height값을 준 것
    return view
}()
```

<br>

#### 2. SnapKit 사용해서 오토레이아웃 구현

: 오토레이아웃을 코드로 구현할 때 좀 더 짧게 작성할 수 있도록 도와주는 라이브러리를 이번에 스터디 발표로 맡게 됐는데 그래서 과제에도 사용해보았당ㅎㅎ 생각보다 간단했고,, `isActive=true`랑 `.translatesAutoresizingMaskIntoConstraints=false`를 안써줘도 돼서 넘나리 행복한 것!!
<br>

1️⃣ 클로저 형식을 사용했을 경우
```
profileImage.snp.makeConstraints { (make) in
   make.top.equalTo(contentView.snp.top).offset(4)
   make.leading.equalTo(contentView.snp.leading).offset(16)
   make.bottom.equalTo(contentView.snp.bottom).offset(-5)
}
```


2️⃣ 클로저의 매개변수 대신 단축 이름인자를 사용했을 경우
```
tableView.snp.makeConstraints {
   $0.top.equalTo(upperView.snp.bottom)
   $0.leading.equalTo(view.snp.leading)
   $0.bottom.equalTo(view.snp.bottom)
   $0.trailing.equalTo(view.snp.trailing)
}
```


<br>

#### 3. Contextual Menu -> `contextMenuConfigurationForRowAt` 메소드 사용

:해당 메소드는 return값으로 `UIContextMenuConfiguration`을 받고 `init(identifier:_, previewProvider:_, actionProvider:_)`으로 초기화를 해주는데 previewProvider에서는 사용자가 보여주고 싶은 뷰컨을 반환해주는 것이고, actionProvider에서는 미리보기와 함께 표시할 상황에 맞는 메뉴를 반환해주는 것이다. 

```
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
    
```

<br>


#### 4. TableView Swipe Menu -> `trailingSwipeActionsConfigurationForRowAt` 메소드 사용


```
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
    
```

<br>
<br>

<hr>

### 2️⃣ 어려웠던 점 👊🏻👊🏻👊🏻

**1. Contextual Menu를 구현시 미리보기 화면에서 프사, 이름이 보이지 않았던 문제**

+ 해결 방법 : previewProvider의 반환값에서도 MyProfileViewController에서 선언해줬던 프로퍼티에 접근해 데이터를 넘겨주는 식으로 해결하였다.

```
   func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil) { () -> UIViewController? in
            
            let preview = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as? MyProfileViewController
            preview?.imageName = self.friendList[indexPath.row].profileImageName
            preview?.name = self.friendList[indexPath.row].name
            
            return preview
```          

<br>
<br>

**2. TableView Cell 선택하면 프사와 이름 데이터가 전달되지 않는 부분**

 - 해결 방법 : Property에 접근하여 데이터를 전달하는 방식으로 해결<br>
 - 데이터를 전달하는 뷰 : FriendViewController -> 화면 전환할 때 프로퍼티에 데이터 넘겨주기
 - 데이터를 전달받는 뷰 : MyProfileViewController -> 빈 문자열 형식의 프로퍼티 하나 선언해주기

```
// ✅ FriendViewController
// didSelectRowAt 메소드 -> 테이블 뷰 셀을 선택할 때 호출되는 함수

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController") as? MyProfileViewController
        else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        
        // ▶️ 셀 선택 시 데이터 전달
        
        nextVC.name = friendList[indexPath.row].name
        nextVC.imageName = friendList[indexPath.row].profileImageName

        self.present(nextVC, animated: true, completion: nil)
    }
```

```
// ✅ MyProfileViewController

var imageName : String = ""
var name : String = ""

override func viewDidLoad() {
    super.viewDidLoad()
        
    profileImageView.image = UIImage(named: imageName)
    profileNameLabel.text = name
        
}  

```

<br>

**3. 내 프로필 셀 선택 시 데이터 전달이 안되는 부분**

 - 해결 방법 : 내 프로필 부분은 tableView header로 구현해줘서 따로 데이터 전달이 먹지 않아 애를 먹었다. 그래서 어차피 이 부분은 데이터가 고정되어 있기 때문에 `profileButtonTapped` 함수가 실행될 때 **nil 병합연산자**를 통해 해결해줬다. <br>


```
@objc func profileButtonTapped(_ sender: UIButton!) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController")
                as? MyProfileViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        
        // ▶️ 여기 이 부분
        nextVC.name = myNameLabel.text ?? "루키루키마슈퍼루키루키루키"
        nextVC.imageName = "friendtabProfileImg"
        
        self.present(nextVC, animated: true, completion: nil)
}


```

<br>
<hr>
<br>

🦋 ... 이번에는 스터디 발표로 code base로 테이블 뷰 구현하기를 맡아서 과제도 몇부분 스보를 사용하지 않고 코드를 통해 구현해봤는데,, 후^^.. 쉽지 않았다. <br>😭 약간 돌이킬 수 없는 강을 건넌 느낌이랄까? 오토레이아웃을 코드로 쓰니까 진짜 너무 줄이 길어지고 귀찮아서,, 아,, 이래서 다들 Snapkit을 쓰는구나 싶었다.. Snapkit 만만세~ 근데 확실히 스보보다 코드로 오토레이아웃을 주니까 수정할 때 편하당 ㅎㅎ

🦋 delegate pattern이 사실 완벽하게 이해가지 않아서 그냥 외웠다. 외웠는데도 아직 ㅇㅅaㅇ.. 그리고 데이터 전달할 때 델리게이트로 해보려 했지만 실패해서 프로퍼티로 했고 그게 더 쉬웠다는.. 괜히 시간을 날림..

🦋 그래도 도전과제들은 저번보다는 쉬운 느낌..^^*




















