//
//  observable.swift
//  ObserverSwift
//
//  Created by Nguyen Trong Khoi on 3/19/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation




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
