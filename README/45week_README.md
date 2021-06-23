### 클라-디자인 합동 세미나 과제의 리드미입니다 ✨


#### 📌 과제 조건

- ✅ myNote UI 뷰 구현
- ✅ myNote 서버 연결

<br>


### 🥳 Tada ~ 결과화면


#### 👉🏻 구현영상 ( 영상의 첫 번째 뷰만 구현, 화면 전환 후는 구현 담당 X )

<img width="30%" alt="스크린샷 2021-06-23 오후 11 53 24" src="https://user-images.githubusercontent.com/63235947/123119592-a25e7800-d47e-11eb-9926-580727381de2.gif">


<br>


<hr>

### 새로 알게된 점 또는 새로 시도한 것 🤩🤩🤩

#### **1. UI 구현**

: `bookListArray[indexPath.row-2]`에서 `-2`를 해줘야 하는 이유에 대해서 깨달았다.<br>
왜냐하면 책이 들어가야 하는 곳은 bookListArray[2]부터니까 `numberOfRowsInSection`에서 return 값으로 `bookListArray.count + 2`을 줬기 때문에 bookListArray.count를 제외한 2를 빼줘야 한다.

```
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        
        case 0:
            return 1
            
        default:
            // headerview 기준으로 나눠서 아래에 5개가 들어가는 이유는..
            // 책이 6권 들어갈 경우... -> 기존 chipcell + booklistmenucell +6권(booklistcell)
            return bookListArray.count + 2
        }
    }
```    
    
```
booklistCell.setData(bookTitle: bookListArray[indexPath.row-2].title,
                                     bookAuthor: bookListArray[indexPath.row-2].author,
                                     bookHighlightCount: bookListArray[indexPath.row-2].highlightCount,
                                     bookHighlight: bookListArray[indexPath.row-2].highlights.first!.highlightText,
                                     bookDate: bookListArray[indexPath.row-2].highlights.first!.highlightDate,
                                     bookCoverImage: bookListArray[indexPath.row-2].image)
                
```

<br>

#### **2. 서버 연결**

: 데이터를 디코드하고 `decodedData`에 저장할 때 서버 쪽에서 넘겨준 데이터가 배열 형태일 경우에는 
미리 선언해둔 `bookListArray` 배열에 바로 대입하면 된다. 굳이 배열 안에 있는 데이터를 하나하나 꺼내지 않아도 된다는 점을 새로 알았다!

: 또 테이블 뷰나 컬렉션 뷰일 경우에는 `reloadData()`가 필수!


```
func getData() {

        GetBooklistDataService.shared.getBookInfo { (response) in
            switch(response) {
            
            case .success(let bookData):
                                
                if let decodedData = bookData as? [BookDetail] {
                    
                    self.bookListArray = decodedData
                    self.noteTableView.reloadData()
                                        
                }
                
            case .requestErr(let bookData):
                print("requestERR", bookData)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
```





















