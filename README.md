# Observer-Design-Pattern

### What is Observer : 
According to the [wikipedia](https://en.wikipedia.org/wiki/Observer_pattern)  Observer Pattern is :
 > “ A software design pattern in which an object, called the **subject**, maintains a list of its dependents, called **observers**,and notifies them automatically of any state changes, usually by calling one of their methods. It is mainly used to implement distributed event handling systems” .

### Architecture: Design Observer :
  ![alt text](https://s3-ap-southeast-1.amazonaws.com/kipalog.com/uh1m1rgz6m_500px-Observer.svg.png)

### Here is the demo observer in swift: 
First, create Observer protocol. This protocol contents essentially implements **update** function.
```swift
protocol Observer{
    
    var observerID: Int{ get }
    
    func update(key : String)
}
```

Then create observable module. That module will content some method below

* register 

* unregister 
 
* notifyObserver 

```swift
private var observers = [Observer]()

func register(observer: Observer){
    observers.append(observer)
}

func unregister(obsever: Observer){
   
    observers = observers.filter{
        $0.observerID != obsever.observerID
    }
    
}

func notifyObserver(key: String){
    
    for observer in observers {
        observer.update(key: key)
    }
}
```

Let’s take a look at a couple classes now that makes use of all of this. In our fictional scenario we will assume i want to resign so i should send notifite to both Boss and HumanResource and my Colleague . So earch persion in my company will process will recieve messsage and process difirrence.

```Swift
class Boss : Observer{
    var observerID: Int = 1
    init() {
        register(observer: self)
    }
    func update(key: String) {
        print("Boss is recieved Khoi's resignation letter but dont care .")
    }
    deinit {
        unregister(obsever: self)
    }
}



class HumanResource : Observer{
    
    var observerID: Int = 2
    
    init() {
        register(observer: self)
    }
    
    func update(key: String) {
        print("HumanResource is recieved Khoi's resignation letter .")
        switch key {
        case "Resign":
            doResignProcess()
            break
        default:
            break;
        }
    }
    
    func doResignProcess(){
        print("HR : start resign process")
    }
    deinit {
        unregister(obsever: self)
    }
}


class Colleague : Observer{
    var observerID: Int = 3
    init() {
        register(observer: self)
    }
    func update(key: String) {
        print("Colleague is recieved Khoi's resignation letter .")
        switch key {
        case "resign":
            gotoDringBeer()
            break;
        default:
            break;
        }
    }
    func gotoDringBeer(){
        print("Colleague: Let go to drink beer .Send Congratulation to me")
    }
    
    
    deinit {
        unregister(obsever: self)
    }
}

let boss = Boss()
let hr = HumanResource()
let colleague = Colleague()
notifyObserver(key: "resign")
```

The result is :
```
Boss is recieved Khoi's resignation letter but dont care .
HumanResource is recieved Khoi's resignation letter .
HR : start resign process
Colleague is recieved Khoi's resignation letter .
Colleague: Let go to drink beer .Send Congratulation to me
```

You can see the result message:" each object which attached to the observer will receive an event then delivers message to do some different job. "


### When should use Observer :
When programs have a source like (socket netowk,...) and, each change state of the source will need to deliver to a lot of instances. Which each instance, will do another job. This design parter will really make the program is clearly and degree a lot of code.

Which in my experience when implementing observer for a C ++ TCP socket game. I am very comfortable to use this design pattern. So I want to write something to share my knowledge to everyone.
My English and technical skill, maybe not too good so I am really appreciated if anyone want to discuss or help me correct some mistake in this article
