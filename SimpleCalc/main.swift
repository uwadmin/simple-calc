//
//  main.swift
//  SimpleCalc
//
//  Created by ​ on 10/6/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import Foundation

extension String: Error {
}

func isNil(num: Double?) -> Bool {
    return num == nil
}

func isOp(op: String) -> Bool {
    return (op == "+" || op == "-" || op == "*" || op == "/")
}

func isCmd(cmd: String) -> Bool {
    return (cmd == "avg" || cmd == "count" || cmd == "fact")
}


while true {
    guard let rawInput1 = readLine() else {
        throw "error"
    }
    if rawInput1 == "" {
        print("Please input something")
        continue
    } else {
        let input1 = rawInput1.trimmingCharacters(in: .whitespacesAndNewlines)
        if !input1.contains(" ") {
            let num1 = Double(input1)
            if isNil(num: num1) {
                print("Please input a valid number")
                continue
            } else {
                while true {
                    guard let op = readLine() else {
                        throw "error"
                    }
                    if !isOp(op: op) {
                        print("Please input a valid operator")
                        continue
                    } else {
                        while true {
                            guard let rawInput2 = readLine() else {
                                throw "error"
                            }
                            let input2 = rawInput2.trimmingCharacters(in: .whitespacesAndNewlines)
                            let num2 = Double(input2)
                            if isNil(num: num2) {
                                print("Please input a valid number")
                                continue
                            } else {
                                switch op {
                                case "+": print("\(num1! + num2!)")
                                case "-": print("\(num1! - num2!)")
                                case "*": print("\(num1! * num2!)")
                                case "/": print("\(num1! / num2!)")
                                default: break
                                }
                            }
                            break
                        }
                    }
                    break
                }
            }
        } else {
            let arr = input1.components(separatedBy: " ")
            let count = arr.count - 1
            let cmd: String = arr.last!
            let numbers = arr.flatMap {
                Double($0)
            }
            if numbers.count < count {
                print("Please input valid numbers")
                continue
            } else if !isCmd(cmd: cmd) {
                print("Please input a valid command")
                continue
            } else {
                switch cmd {
                case "count": print(count)
                case "avg":
                    let sum = numbers.reduce(0, +)
                    let avg = sum / Double(count)
                    print(avg)
                case "fact":
                    if numbers.count != 1 {
                        print("Factorial can only perform on one number, please input again")
                        continue
                    }
                    var fact: Int = 1
                    let n: Int = Int(arr.first!)! + 1
                    for i in 1..<n {
                        fact = fact * i
                    }
                    print(fact)
                default: break
                }
            }
        }
    }
    break
}