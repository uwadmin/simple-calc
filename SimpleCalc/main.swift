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

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension String {
    var condensedWhitespace: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter {
            !$0.isEmpty
        }.joined(separator: " ")
    }
}

func isNil(num: Double?) -> Bool {
    return num == nil
}

func isOp(op: String) -> Bool {
    return (op == "+" || op == "-" || op == "*" || op == "/" || op == "%")
}

func isCmd(cmd: String) -> Bool {
    return (cmd == "avg" || cmd == "count" || cmd == "fact")
}

print("Welcome to Chao Ma's simple-calc cli tool for some basic calculations\n" +
        "You could type a number and return. Then type the operator (+ - * / %)\n" +
        "and return and then type another number to do the basic calculations.\n" +
        "You could also type \"a b c {command}\" for other calculations. Available\n" +
        "ones are \"count\", \"avg\" and \"fact\".\n")
repeat {
    while true {
        print("Please type below: ")
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
                        guard let rawOp = readLine() else {
                            throw "error"
                        }
                        let op = rawOp.trimmingCharacters(in: .whitespacesAndNewlines)
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
                                    case "+": print("\((num1! + num2!).clean)")
                                    case "-": print("\((num1! - num2!).clean)")
                                    case "*": print("\((num1! * num2!).clean)")
                                    case "/": print("\((num1! / num2!).clean)")
                                    case "%": print("\(num1!.truncatingRemainder(dividingBy: num2!))")
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
                let arr = input1.condensedWhitespace.components(separatedBy: " ")
                let count = arr.count - 1
                let cmd: String = arr.last!
                let numbers = arr.flatMap {
                    Double($0)
                }
                if numbers.count < count {
                    print("Please input valid numbers")
                    print(arr)
                    print(numbers.count)
                    print(count)
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
                        print(avg.clean)
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
    print("Do you want to do another calculation? (answer yes or no): ", terminator: "")
} while (readLine()?.first == "y")
