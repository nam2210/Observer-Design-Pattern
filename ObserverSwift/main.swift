//
//  main.swift
//  ObserverSwift
//
//  Created by Nguyen Trong Khoi on 3/19/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation




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
        case "resign":
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




