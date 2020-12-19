//
//  Dictionary.swift
//  testTask
//
//  Created by Виталий on 12/19/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

struct Item{
    var name:String
    var link:String
}


class RemoteStorage: NSObject {

    var itemDictionary: Array = [
            Item(name:"", link:"pic1"),
            Item(name:"", link:"pic2"),
            Item(name:"", link:"pic3"),
            Item(name:"", link:"pic4"),
            Item(name:"", link:"pic5"),
            Item(name:"", link:"pic6"),
        ]

    func getItems() -> Array<Item>{

    return itemDictionary
        
    }
}
    
    


