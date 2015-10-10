//
//  ViewController.swift
//  SwiftEnum
//
//  Created by FrankLiu on 15/10/9.
//  Copyright © 2015年 FrankLiu. All rights reserved.
//

import UIKit

// 指定Int型rawValue
enum Rank : Int {
    
    case Ace = 1
    
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .Ace:
            
            return "ace"
            
        case .Jack:
            
            return "jack"
            
        case .Queen:
            
            return "queen"
            
        case .King:
            
            return "king"
            
        default:
            
            return String(self.rawValue)
        }
    }
    
    func compareRank(anotherRank:Rank) -> String {
    
        if self.rawValue > anotherRank.rawValue {
            
            return "\(self.simpleDescription()) is bigger than \(anotherRank.simpleDescription()) !"
        
        } else if self.rawValue < anotherRank.rawValue {
        
            return "\(self.simpleDescription()) is smaller than \(anotherRank.simpleDescription()) !"
            
        } else {
        
            return "\(self.simpleDescription()) is equal to \(anotherRank.simpleDescription()) !"
        }
        
    }
}

// 不指定类型是没有rawValue
enum Suit {

    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDiscription() -> String {
    
        switch self {
        
        case .Spades:
            
            return "spades"
            
        case .Hearts:
            
            return "hearts"
            
        case .Diamonds:
            
            return "diamonds"
            
        case .Clubs:
            
            return "clubs"
            
        }
    }
    
    func color() -> String {
    
        switch self {
        
        case .Spades, .Clubs:
            
            return "black"
            
        case .Hearts, .Diamonds:
            
            return "red"
            
        }
    }
}

// 指定String型rawValue
enum CompassPoint: String {

    case North,
         South,
         East,
         West
}

// 这是一种嵌套写法
enum ArithmeticExpression {

    case Number(Int)
    
    indirect case
             Addtion(ArithmeticExpression, ArithmeticExpression)
    indirect case
             Multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 这是另一种嵌套写法
//indirect enum ArithmeticExpression {
//
//    case Number(Int)
//    
//    case Addition(ArithmeticExpression, ArithmeticExpression)
//    
//    case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}

func evaluate(expression: ArithmeticExpression) -> Int {

    switch expression {
    
    case .Number(let value):
        
        return value
        
    case .Addtion(let left, let right):
        
        return evaluate(left) + evaluate(right)
        
    case .Multiplication(let left, let right):
        
        return evaluate(left) * evaluate(right)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let ace = Rank.Ace
        
        _ = ace.rawValue
        
        if let convertedRank = Rank(rawValue: 3) {
        
            _ = convertedRank.simpleDescription()
        }
        
        print("\(Rank.Five.compareRank(Rank.Jack))")
        
        print("\(Suit.Diamonds.color())")
        
        print("\(CompassPoint.East.rawValue)")
        
        // 枚举嵌套用法
        // evaluate (5 + 4) * 2
        let five = ArithmeticExpression.Number(5)
        
        let four = ArithmeticExpression.Number(4)
        
        let sum  = ArithmeticExpression.Addtion(five, four)
        
        let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
        
        print(evaluate(product))

    }
}

