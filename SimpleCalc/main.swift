//
//  main.swift
//  SimpleCalc
//
//  Created by ​ on 10/6/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import Foundation

let input1 = readLine()
let input2 = readLine()

if let response1 = input1,
   let response2 = input2,
   let num1 = Int(response1),
   let num2 = Int(response2) {
    print("The sum of \(num1) and \(num2) is \(num1 + num2)")
}
