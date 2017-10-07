//
//  main.swift
//  SimpleCalc
//
//  Created by ​ on 10/6/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import Foundation

if let input1 = readLine(),
   let op = readLine() {
    let num1 = Double(input1)

    if op == "+" || op == "-" || op == "*" || op == "/" {
        let input2 = readLine()
        let num2 = Double(input2!)
        if op == "+" {
            print("\(num1! + num2!)")
        } else if op == "-" {
            print("\(num1! - num2!)")
        } else if op == "*" {
            print("\(num1! * num2!)")
        } else if op == "/" {
            print("\(num1! / num2!)")
        }
    }

    if op == "count" || op == "avg" {
        let numbers = input1.split(separator: " ")
        let count = numbers.count;
        if op == "count" {
            print(count)
        }
        if op == "avg" {
            let result = numbers.flatMap {
                Double($0)
            }
            let sum = result.reduce(0, +)
            let avg = sum / Double(count)
            print(avg)
        }
    }

    if op == "factor" {
        var fact: Int = 1
        let n: Int = Int(num1!) + 1
        for i in 1..<n{
            fact = fact * i
        }
        print(fact)
    }
}

