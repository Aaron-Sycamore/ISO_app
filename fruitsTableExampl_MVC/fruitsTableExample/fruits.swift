//
//  fruits.swift
//  fruitsTableExample
//
//  Created by user on 9/15/16.
//  Copyright © 2016 ASU. All rights reserved.
//

import Foundation

class fruits
{
    var fruits:[fruit] = []
    
    init()
    {
        let f1 = fruit(fn: "San Francisco", fd: "large city in Californa. The football team the 49ers reside in ths city", fin: "San Francisco.jpg")
        let f2 = fruit(fn: "Phoenix", fd: "Very Hot but mild winters. ASU is the best college in the state", fin: "Phoenix.jpg")
        let f3 = fruit(fn: "New York", fd: "very big city in the East Coast. The Statue of Liberty is here along with Elis Island", fin: "New York.jpeg")
        let f4 = fruit(fn: "Boston", fd: "A Historic City dating back to the origanal 13 colines. This is the city the bosten tie party took place", fin: "Boston.jpg")
        let f5 = fruit(fn: "Seattle", fd: "It rains here alot. It has very mild summers but cold winters", fin: "Seattle.jpg")
        
        
        fruits.append(f1)
        fruits.append(f2)
        fruits.append(f3)
        fruits.append(f4)
        fruits.append(f5)
        
    }
    
    func getCount() -> Int
    {
        return fruits.count
    }
    
    func getFruitObject(item:Int) -> fruit{
        
        return fruits[item]
    }
    
    func removeFruitObject(item:Int) {
        
         fruits.remove(at: item)
    }
    
    func addFruitObject(name:String, desc: String, image: String) -> fruit{
        let f = fruit(fn: name, fd: desc, fin: image)
        fruits.append(f)
        return f
    }
    
}
class fruit
{
    var fruitName:String?
    var fruitDescription:String?
    var fruitImageName:String?
    
    init(fn:String, fd:String, fin:String)
    {
        fruitName = fn
        fruitDescription = fd
        fruitImageName = fin
        
    }
    
    
}
