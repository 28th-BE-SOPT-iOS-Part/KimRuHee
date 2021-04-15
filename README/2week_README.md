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
<br>

#### 1️⃣ 새로 알게된 코드 🤩🤩🤩

1. **Modal 쓸어서 Dismiss**
<br>
: 설명 쓰기 -> 아직...

    ``` ? ```

    
<br>
<br>


#### 2️⃣ 어려웠던 점 👊🏻👊🏻👊🏻

**1. 로그인/회원가입 -> 카카오톡 홈으로 화면전환이 안되는 문제**
+ 해결 방법 : Storyboard Reference의 Storyboard ID를 안줘서 엑코가 파일 인식을 못했던 것.. 잊지말자!

<img width="500" alt="Screen Shot 2021-04-15 at 1 42 07 AM" src="https://user-images.githubusercontent.com/63235947/114750676-33ceb100-9d8f-11eb-843b-23feef045249.png">

<br>
<br>

**2. 로그인/회원가입 -> 카카오톡 홈으로 화면전환 후 탭바가 안 생기는 문제**

 - 첫 번째 해결 방법 : UITabBarController를 상속받는 클래스를 만들어서 연결 <br>코코아 터치 클래스에서 UIViewController가 아닌 UITabBarController를 선택해줘야 한다!<br>

```

let storyboard = UIStoryboard(name: "Main", bundle: nil)
guard let nextVC = storyboard.instantiateViewController(identifier: "MainTabBarController") as? MainTabBarController else { return }

self.navigationController?.pushViewController(nextVC, animated: true)

```

📖 ```let storyboard = UIStoryboard(name: "Main", bundle: nil)``` <br>  이 부분은 나는 MainTabBarController를 Main.storyboard 파일에 만들어줬기 때문에 굳이 안써도 작동은 하지만 만약 새로운 storyboard 파일로 분리해줬다면 꼭 선언해서 어떤 스토리보드인지 알려줘야 한다.

<br> 
  - 두 번째 해결 방법 : 그냥 UITabBarController 자체를 코드로 구현
```
// 탭바 컨트롤러 코드 구현한 부분

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
<br>


**3. iPhone SE 규격에서 카카오톡 프로필 뷰의 하단 메뉴가 짤리는 문제**
- 해결 방법 : 하단 오토레이아웃 constraint를 superview의 bottom에 줌

<br>


... 후,, 리드미 다 썼는데 날아감;;😳🤯 마치 비둘기마냥,,ㅎ후,, 🦅🦅




















