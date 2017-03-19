//
//  main.swift
//  ObserverSwift
//
//  Created by Nguyen Trong Khoi on 3/19/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation

print("Hello, World!")



class Worker1 : Observer{
    
    var observerID: Int = 1
    init() {
        register(observer: self)
    }
    
    func update(key: String) {
        print("Woker 1 recieve")
        switch key {
        case "Worker1":
            workerDowork()
        case "workall":
            workerDowork()
            break
            
        default: break
            
        }
        
    }
    
    
    
    
    func workerDowork(){
        print("Worker 1 làm việc nào")
    }
    
    deinit {
        unregister(obsever: self)
    }
    
}



class Worker2 : Observer{
    
    var observerID: Int = 2
    
    init() {
        register(observer: self)
    }
    
    func update(key: String) {
        print("Woker 2 recieve")
        switch key {
        case "Worker2":
            workerDowork()
            break
        case "workall":
            workerDowork()
            break
        default:
            break;
        }
        
    }
    
    func workerDowork(){
        print("Worker 2 làm việc nào")
    }
    
    
    
    deinit {
        unregister(obsever: self)
    }
    
    
}

let worker1 = Worker1()
let woekr2 = Worker2()


notifyObserver(key: "Worker1")
notifyObserver(key: "Worker2")
notifyObserver(key: "workall")
notifyObserver(key: "nothing")




