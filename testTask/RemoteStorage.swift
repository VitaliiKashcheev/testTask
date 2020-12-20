//
//  Dictionary.swift
//  testTask
//
//  Created by Виталий on 12/19/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

struct Item{
    var code:String
    var pictureName:String
}


class RemoteStorage: NSObject {

    var itemArray: Array = [
            Item(code:"", pictureName:"pic1"),
            Item(code:"", pictureName:"pic2"),
            Item(code:"", pictureName:"pic3"),
            Item(code:"", pictureName:"pic4"),
            Item(code:"", pictureName:"pic5"),
            Item(code:"", pictureName:"pic6"),
        ]

    func getItems() -> Array<Item>{

    return itemArray
        
    }
}
    
    


