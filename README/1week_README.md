### 1주차 과제의 리드미입니다 ✨


#### 📌 과제 조건

- 모든 텍스트 필드에  clear 버튼  있을  것
- 텍스트가 있는 경우에만 clear 버튼 노출
- 텍스트 필드에는 placeholder 달기
- 로그인/회원가입 시, 모든 항목이 채워져 있지 않을 경우에는 버튼 누르면 동작이 일어나지 않을 것
- 비밀번호 입력 시, 내용 표기되지 않을 것 = Secure Text Entry 옵션


<br>


#### 🥳 Tada ~ 결과화면



<img width="30%" src="https://user-images.githubusercontent.com/63235947/114574932-a7e85680-9cb4-11eb-844f-8c85396de256.gif"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img width="30%" src="https://user-images.githubusercontent.com/63235947/114653567-46ab9c00-9d23-11eb-998c-5fc107d18ffa.mov"/>


<br>

##### 1️⃣ 사용한 코드 😎😎😎

1. **UIAlertController / UIAlertAction**
    <br>: 회원가입 시, 비밀번호가 다를 경우 알람창 띄우기

```
if  pwTextfield.text != checkPwTextField.text {
            
            // 비번 일치하지 않을 경우
            pwView.backgroundColor = .red
            checkPwView.backgroundColor = .red
            
            let alert = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        
        }
```


<br>

##### 2️⃣ 새로 알게된 코드 🤩🤩🤩

1. **textField.hasText**
: 텍스트 필드에 텍스트가 있는지 없는지 확인할 수 있게 해주는 Boolean value
    ``` emailTextField.hasText == true && pwTextfield.hasText == true && checkPwTextField.hasText == true ```

    

<br>

##### 3️⃣ 어려웠던 점 👊🏻👊🏻👊🏻

> 3번째 화면에서 확인 버튼을 누르면 1번째 화면으로 넘어가는 걸 몰랐다.. 포기하고 커밋했다가 마감 한 시간 전에 스터디 팀의 도움을 받아 다시 어찌저찌 다시 해서 냈다.
> 1. unwindToFirst 메소드를 시도했지만 안됨
> 2. 2번째 VC에서 화면을 present 할 때 동시에 해당 화면을 pop 해줌
> ```
> self.present(nextVC, animated: true, completion: nil)
> self.navigationController?.popViewController(animated: true)
> ```
> 
> 
> ```
> self.present(nextVC, animated: true) {
>     self.navigationController?.popViewController(animated: true)
> }
>    ```
>    - 추후 2주차 세미나에서 과제의 정답은 위와 같았음. <br>
>    도대체 completion은 뭐고,, 무슨 차이인 것일까;; 아요찌랭이인 나에게는 넘나 어려운 것이었다..

<br>

##### ❓ **Completion Handler**는 무엇인가... 

: completion은 어떠한 일이 끝났을 때 진행할 업무를 담당한다고 한다. 공식문서를 살펴보면 'The block to execute after the presentation finishes.' 이라고 나와있음.. 그러니까 즉,, 

우리가 흔히 보는
```self.present(nextVC, animated: true, completion: nil)``` 에서 **[ completion: nil ]** 의 의미는
현재 실행하고 있는 일이 끝나면 딱히 너가 해야 할 그 다음 일은 없다는 뜻이다.

<br>

##### ❓그래서 **저 위 코드의 차이는 무엇인가?!!**

: 간단한 코드에서는 차이가 딱히 없다고 한다. 하지만 추후에 비동기 처리 등을 고려하면 completion 안에 넣는 것을  추천한다고 한다.. 그렇다.



















