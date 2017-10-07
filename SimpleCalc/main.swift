//
//  main.swift
//  SimpleCalc
//
//  Created by ​ on 10/6/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import Foundation

let input1 = readLine()
let op = readLine()
let num1 = Double(input1!)

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

if op == "count" {
    let response = "\(input1)"
    let numbers = response.split(separator: " ")
    print(numbers.count)
}