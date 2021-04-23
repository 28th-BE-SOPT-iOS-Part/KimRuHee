### 2주차 과제의 리드미입니다 ✨


#### 📌 과제 조건

- ✅ 오토레이아웃 구현
- ✅ 로그인/회원가입 뷰 -> 카카오톡 홈으로 바로 이동
- ✅ 카카오톡 홈 탭바 구현 (선택 시 검은색)
- ✅ 카카오톡 홈 프로필 사진 선택 시 present/dismiss
- ✅ 도전과제 : 프로필 화면 아래로 스와이프해서 dismiss

<br>


#### 🥳 Tada ~ 결과화면


##### 👉🏻 구현영상 ( 기본과제 / 도전과제 )

<img width="30%" src="https://user-images.githubusercontent.com/63235947/114887906-c9c41380-9e43-11eb-9272-8574c4e72c59.gif"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img width="30%" src="https://user-images.githubusercontent.com/63235947/115923608-71cb8380-a4b9-11eb-85fe-30ffd53fff38.mov"/>

<br>

##### 👉🏻 오토레이아웃

<img width="1440" alt="오토레이아웃" src="https://user-images.githubusercontent.com/63235947/114748016-6a56fc80-9d8c-11eb-984e-856b9856346d.png">

<br>
<br>

#### 1️⃣ 새로 알게된 코드 🤩🤩🤩

**: 모달 화면 아래로 스와이프해서 Dismiss**
<br>

#### 1. UIPanGestureRecognizer 클래스 사용


: UIGestureRecognizer의 하위클래스로 화면을 탭 후에 상하좌우로 Drag하는 제스쳐를 통해 화면에 변화를 줄 때 사용한다.
나는 addGestureRecognizer(_: ) 메소드를 통해 코드로 추가해줬다.



```
    func modalDismiss() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }

    @objc func handleDismiss(_ sender: UIPanGestureRecognizer) {
        
        viewTranslation = sender.translation(in: view)
        viewVelocity = sender.velocity(in: view)
        
```


#### 2. animate 함수 사용

: withDuration - 동작시간 /  animations - 동작하는 구간

#### 3. transform 프로퍼티 사용

: CGAffineTransform 타입을 갖는 프로퍼티로 코드 형태는 ```self.view.transform = CGAffineTransform(translationX: 0, y: 100)``` 이렇게 작성해준다. 이 의미는 x 좌표는 이동 안하고, y 좌표는 아래로 100만큼 내려준다는 뜻인데 이 코드를 통해서 .changed 상태에서 view의 y좌표를 이동시켜줬다.

: 좌표 이동 후 다시 원상 복구를 시키기 위해서는 .identity로 값을 주면 된다.

```
    switch sender.state {
    case .changed:
        // 상하로 스와이프 할 때 위로 스와이프가 안되게 해주기 위해서 조건 설정
        if viewVelocity.y > 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                })
            }
    case .ended:
        // 해당 뷰의 y값이 400보다 작으면(작게 이동 시) 뷰의 위치를 다시 원상복구하겠다. = 즉, 다시 y=0인 지점으로 리셋
        if viewTranslation.y < 400 {
            UIView.animate(withDuration: 0.1, animations: {
                self.view.transform = .identity
            })
            // 뷰의 값이 400 이상이면 해당 화면 dismiss
        } else {
            dismiss(animated: true, completion: nil)
        }
        
    default:
        break
    }
    
```

: 별개로,, 도전과제를 구현하면서 어려웠던 점은,, 아래로만 스와이프가 되어야 하는데 나는 위아래로 다 스와이프 돼서 이걸 고치기 위해 별의별 시도를 다 해봤다.

🤯 해결 방법은 생각해보니까 UIPanGestureRecognizer를 처음 공부할 때 zeddiOS 블로그 따라하면서 translation과 velocity 값을 받아서 볼 수 있다는 것이 생각이 났음..!!

그래서 viewVelocity 프로퍼티에 값을 저장하고 ```if viewVelocity.y > 0 ```인 경우에만 가능하게 해줬다. 왜냐하면 결국 viewVelocity.y > 0 이면 무조건 y의 방향은 아래로 향하기 때문에... 근데 이게 맞겠지..?
    




    

    

    
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

📖 ```let storyboard = UIStoryboard(name: "Main", bundle: nil)``` <br><br>  이 부분은 나는 MainTabBarController를 Main.storyboard 파일에 만들어줬기 때문에 굳이 안써도 작동은 하지만 만약 새로운 storyboard 파일로 분리해줬다면 꼭 선언해서 어떤 스토리보드인지 알려줘야 한다.

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





















