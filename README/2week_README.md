### 2주차 과제의 리드미입니다 ✨


#### 📌 과제 조건

- ✅ 오토레이아웃 구현
- ✅ 로그인/회원가입 뷰 -> 카카오톡 홈으로 바로 이동
- ✅ 카카오톡 홈 탭바 구현 (선택 시 검은색)
- ✅ 카카오톡 홈 프로필 사진 선택 시 present/dismiss
- 👊🏻 도전과제 : 프로필 화면 쓸어서 dismiss

<br>


#### 🥳 Tada ~ 결과화면


##### 👉🏻 구현영상 ( 기본과제 / 도전과제 )
<img width="30%" src="https://user-images.githubusercontent.com/63235947/114887906-c9c41380-9e43-11eb-9272-8574c4e72c59.gif"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 

<br>

##### 👉🏻 오토레이아웃

<img width="1440" alt="Screen Shot 2021-04-15 at 1 46 23 AM" src="https://user-images.githubusercontent.com/63235947/114748016-6a56fc80-9d8c-11eb-984e-856b9856346d.png">


<br>

##### 1️⃣ 새로 알게된 코드 🤩🤩🤩

1. **Modal 쓸어서 Dismiss**
<br>

: 설명 쓰기 -> 아직...

    ``` ? ```

    

<br>

##### 2️⃣ 어려웠던 점 👊🏻👊🏻👊🏻

1. 로그인/회원가입 -> 카카오톡 홈으로 **화면전환이 안되는 문제**
- 해결 방법 : Storyboard Reference의 Storyboard ID를 안줘서 엑코가 파일 인식을 못했던 것.. 잊지말자!

<img width="500" alt="Screen Shot 2021-04-15 at 1 42 07 AM" src="https://user-images.githubusercontent.com/63235947/114750676-33ceb100-9d8f-11eb-843b-23feef045249.png">

<br>

2. 로그인/회원가입 -> 카카오톡 홈으로 **화면전환 후 탭바가 안 생기는 문제**
- 근데 왜 안되는 것일까? : ?? -> 아직...
- 해결 방법 : 그냥 코드로 구현
```
// 탭바 스토리보드로 연결했더니 안 떠서 우선,, 코드로 해봄..
            guard let first = storyboard?.instantiateViewController(withIdentifier: "FriendViewController") as? FriendViewController else { return }
            guard let second = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController else { return }
            guard let third = storyboard?.instantiateViewController(withIdentifier: "TagViewController") as? TagViewController else { return }
            guard let fourth = storyboard?.instantiateViewController(withIdentifier: "ShoppingViewController") as? ShoppingViewController  else { return }
            guard let fifth = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }

            let tb = UITabBarController()
            tb.tabBar.tintColor = .black // 선택 시 검정색
            tb.setViewControllers([first, second, third, fourth, fifth], animated: true)
            self.navigationController?.pushViewController(tb, animated: true)
```

<br>

3. iPhone SE 규격에서 카카오톡 프로필 뷰의 **하단 메뉴가 짤리는 문제**
- 해결 방법 : 하단 오토레이아웃 constraint를 superview의 bottom에 줌

<br>


... 후,, 리드미 다 썼는데 날아감;; 마치 비둘기마냥,,ㅎ후,, 🦅🦅




















