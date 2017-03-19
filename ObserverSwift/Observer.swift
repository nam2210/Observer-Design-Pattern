//
//  Observer.swift
//  ObserverSwift
//
//  Created by Nguyen Trong Khoi on 3/19/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation

protocol Observer{
    
    var observerID: Int{ get }
    
    func update(key : String)
}
