# π¦ μνμ°½κ΅¬ λ§€λμ 
>νλ‘μ νΈ κΈ°κ°: 2022-10-31 ~ 2022-11-11 (2μ£Ό)

## π νλ‘μ νΈ μκ°
- Queueμ LinkedList μλ£κ΅¬μ‘°μ λͺ¨λΈ νμμ κ΅¬ννκ³ , μνμ°½κ΅¬ λ§€λμ  μ νλ¦¬μΌμ΄μμ μ μνλ νλ‘μ νΈ μλλ€.
- λμμ± νλ‘κ·Έλλ°(GCD, Operation) κ°λμ κΈ°λ°μΌλ‘ μ§νλμμ΅λλ€.

<img height = 21px, src = "https://img.shields.io/badge/swift-5.6-green">

## π± ν μκ°
 |[Rhovin](https://github.com/yuvinrho)|[μ μ¬](https://github.com/ash-youu)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/soKEJcy.png"> | <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/101683977?v=4">|

- `Rhovin`μ `μ μ¬` νμ μνμ°½κ΅¬ λ§€λμ μλλ€.



###
## π λͺ©μ°¨
#### 1. [UML](#-uml)
#### 2. [Tree](#-tree)
#### 3. [νμλΌμΈ](#-νμλΌμΈ)
#### 4. [κΈ°λ₯ μ€λͺ(μ€ν νλ©΄)](#-κΈ°λ₯-μ€λͺμ€ν-νλ©΄)
#### 5. [νΈλ¬λΈ μν](#-νΈλ¬λΈ-μν)
#### 6. [κ³ λ―Όν μ ](https://github.com/ash-youu/ios-bank-manager/tree/step2#%EF%B8%8F-%EA%B3%A0%EB%AF%BC%ED%95%9C-%EC%A0%90)
#### 7. [μ°Έκ³  λ§ν¬](#-μ°Έκ³ -λ§ν¬)

---

## π UML
<img width = 1000px, src = "https://i.imgur.com/kiGQmMS.png">

---

## π Tree

```
βββ BankManagerConsoleApp
βΒ Β  βββ Bank.swift
βΒ Β  βββ BankManager.swift
βΒ Β  βββ BankWorker.swift
βΒ Β  βββ Client.swift
βΒ Β  βββ NameSpace.swift
βΒ Β  βββ main.swift
βββ BankManagerConsoleAppTest
βΒ Β  βββ LinkedListTest.swift
βΒ Β  βββ QueueTest.swift
βββ DataStruct
 Β Β  βββ LinkedList.swift
 Β Β  βββ Node.swift
 Β Β  βββ Queue.swift
   
```

---

## β± νμλΌμΈ
- **2022.10.31**
  - STEP1 μ§νμ μν Queue, LinkedList κ°λ νμ΅

- **2022.11.01**
  - Queue, LinkedList, Node νμ μ μ
  - STEP1 PR λ°μ‘


- **2022.11.02**
  - μλ£κ΅¬μ‘° νμμ μ μ ν μΈν°νμ΄μ€λ‘ λ¦¬ν©ν λ§
  - κ΅¬νν μλ£κ΅¬μ‘°μ unit test μ§ν

- **2022.11.03**
  - STEP2 κ΅¬νμ μν Bank, BankWorker, Client νμ μ μ

- **2022.11.04**
  - Bank, BankManager, BankWorker, Client κ΅¬νλΆ μμ±
  - Unit test λ©μλ λ€μ΄λ° μμ 
  - STEP2 PR λ°μ‘
  - STEP1 README.md</b> μμ±
---

## π» κΈ°λ₯ μ€λͺ(μ€ν νλ©΄)
### [STEP 1]
- Queue, Linked-list, Node νμμ κ΅¬ννμμ΅λλ€.
- Queue νμ μΈμ€ν΄μ€ λ©μλμ λμμ κ²μ¦νκΈ° μν΄ Unit Testλ₯Ό μ§ννμμ΅λλ€.

### [STEP 2]
- Linked-listνμκ³Ό Queueνμμ νμ©ν΄ MVC μ€ Model ννΈλ₯Ό κ΅¬ννμμ΅λλ€.
- Bank: μν μμ€ν
  - `generateClient()`: κ³ κ° λ¦¬μ€νΈ μλ°μ΄νΈ
  - `openSystem()`: μν κ°μ  λ° μ’λ£ λ©λ΄ μΆλ ₯
- BankManager: λκΈ°μ΄μ κ³ κ° μΆκ° / BankWorkerμκ² μλ¬΄ μ§μ / μν κ°μ  λ° νμ  λ΄λΉ
- BankWorker: BankManagerλ‘λΆν° λ°°μ λ°μ κ³ κ°μ μλ¬΄ μ²λ¦¬
  - STEP3μμ μ¬λ¬λͺμ μνμμ΄ μ‘΄μ¬νλ μ μ κ³ λ €νμ¬ BankWorkable νλ‘ν μ½μ κΈ°λ³Έκ΅¬νμ ν΅ν΄ μΆν μΈμ€ν΄μ€λ₯Ό μ μ°νκ² μμ±ν  μ μλλ‘ νμμ΅λλ€.
  - μλ¬΄μκ° 0.7μ΄ μ¬λ¦½μ `usleep(7 * 100000)`μ ννλ‘ μ£Όμμ΅λλ€. μ΄ λΆλΆμ STEP3 μμ μλ¬΄μ’λ₯(λμΆ, μκΈ)μ λ°λΌ μ μ°νκ² λ°λ μ μλλ‘ μμ ν  μμ μλλ€.
- Client: λκΈ°λ²νΈλ₯Ό κΈ°μ€μΌλ‘ κ΅¬λΆλλ κ³ κ° νμ
- NameSpace: magic numberμ λ€μμ€νμ΄μ€λ₯Ό νμ©
  - μνμ΄ κ°μ§λ μ΅μ-μ΅λ κ³ κ° λͺμ
  - μν μμ€ν λ©λ΄ λ΄μ μ΅μ λ²νΈ
- μ€ννλ©΄

![](https://i.imgur.com/gSttUXU.gif)


---

## π νΈλ¬λΈ μν

- λ¦¬λ·° νμΈ ν μλ°μ΄νΈ μμ !

---

## π€·ββοΈ κ³ λ―Όν μ 

### 1. κ³ κ° μΈμ€ν΄μ€λ₯Ό μμ±νλ λ°©λ²μ λν κ³ λ―Ό
- μ²μμλ νμ€μ μν νλ‘μΈμ€μ μ μ¬νλλ‘ μλμ κ°μ΄ μ§νν  μμ μ΄μμ΅λλ€.
  - 1. κ³ κ°μ΄ μνμ λ°©λ¬Έν΄ λ²νΈνλ₯Ό λ½λλ€.
  - 2. μνμ λμ  κ³ κ°μλ₯Ό νμΈν΄ +1ν μ«μλ₯Ό κ³ κ°μκ² λκΈ° λ²νΈλ‘ λ°νν΄μ€λ€.
```swift
struct Client {
    var ticketNumber: Int?
    
    func getTicketNumber(at bank: Bank) {
        bank.returnTicketNumber()
    }
}

struct Bank {
    var cumulativeClientCount: Int = 0
    
    mutating func returnTicketNumber() {
        cumulativeClientCount += 1
        return cumulativeClientCount
    }
    
    ...
}
```
- νμ§λ§, μμ κ°μ λ‘μ§μΌλ‘ μ§νλλ©΄ mutating λ©μλλ₯Ό νΈμΆνκ² λκΈ° λλ¬Έμ μμμΈ bank λ§€κ°λ³μλ₯Ό μμ ν  μ μλ€λ μ€λ₯κ° λ°μνμμ΅λλ€.
- μ΄ λλ¬Έμ νμ¬λ `Bank`λΌλ μν μμ€ν νμμμ λλ€ν μμ κ³ κ° λ¦¬μ€νΈλ₯Ό μλ°μ΄νΈνλ `generateClient()`κ° ν΄λΉ μ­ν μ λμ νκ² λμμ΅λλ€.
- νλ‘μ νΈμ μκ΅¬μ¬ν­μ μΆ©μ‘±νμ§λ§, κ°μ²΄ μ§ν₯μ μΈ κ΄μ μΌλ‘λ κ³ κ°μ΄ λ³ΈμΈμ λκΈ°νλ₯Ό μνμΌλ‘λΆν° λ°νλ°λ κ²μ΄ λ μ μ νλ€κ³  μκ°λλλ°, λ¬Έμ λ₯Ό ν΄κ²°ν  μ μ ν λ°©λ²μ μ°ΎκΈ° μ΄λ €μ λ κ² κ°μ΅λλ€.
  - structλ₯Ό μ¬μ©νλ€λ©΄ λ§€κ°λ³μλ₯Ό inoutμΌλ‘ μ€μ§, μλλ©΄ structλ₯Ό classλ‘ λ³κ²½ν μ§ κ³ λ―Όνμ΅λλ€.


---

## π μ°Έκ³  λ§ν¬
- [UML: ν΄λμ€ λ€μ΄μ΄κ·Έλ¨κ³Ό μμ€μ½λ λ§€ν](https://www.nextree.co.kr/p6753/)
- [Linked List](https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8)
- [Queue](https://ko.wikipedia.org/wiki/%ED%81%90_(%EC%9E%90%EB%A3%8C_%EA%B5%AC%EC%A1%B0))
- [The Swift Programming Language: Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
