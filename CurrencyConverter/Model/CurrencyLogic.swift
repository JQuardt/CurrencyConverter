//
//  CurrencyLogic.swift
//  CurrencyConverter
//
//  Created by Jenna Marquardt on 2/13/24.
//

import Foundation

struct CurrencyLogic {
    var euroSwitch = true
    var poundSwitch = true
    var ausDollarSwitch = true
    var canDollarSwitch = true
    var usd : Int = 0
    var euro : Int = 0
    var pound : Int = 0
    var ausDollar : Int = 0
    var canDollar : Int = 0
    
    enum TextError : Error {
        case TextInvalid(reason: String)
        case NoValue(reason: String)
    }
    
    mutating func convert(_ value : Int) {
        usd = value
        //Euro 1 USD to .93
        euro = Int(Double(value) * 0.93)
        //Pound Sterling 1 USD to .79
        pound = Int(Double(value) * 0.79)
        //Australian Dollar 1 USD to 1.55
        ausDollar = Int(Double(value) * 1.55)
        // Canadian Dollar 1 USD to 1.36
        canDollar = Int(Double(value) * 1.36)
    }
    
    mutating func sendValue(_ text : String) -> (result: String, isValid: Bool) {
        //Error checking for value typed in text field.
        do {
            try checkValue(text)
            //If valid, update variables in currency logic
            convert(Int(text)!)
            return (String(usd), true)
        } catch TextError.TextInvalid(let reason) {
            //If invalid, return error string.
            return (reason, false)
        } catch TextError.NoValue(let reason) {
            return (reason, false)
        } catch {
            return ("Error found", false)
        }
    }
    
    func checkValue(_ text : String) throws {
        if text.isEmpty {
            throw TextError.NoValue(reason: "Please type a value.")
        }
        let integers: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        for char in text {
            if integers.contains(char) {
            } else {
                throw TextError.TextInvalid(reason: "The value must be an integer.")
            }
        }
    }
    
    func getAmount() -> Int {
        return usd
    }
    
    func getSwitchArray() -> Array<Bool> {
        return [euroSwitch, poundSwitch, ausDollarSwitch, canDollarSwitch]
    }
    
    func getConversions() -> Array<Int> {
        return [euro, pound, ausDollar, canDollar]
    }
    
    mutating func setEuroSwitch(_ switchValue : Bool) {
        if switchValue {
            euroSwitch = true
        } else {
            euroSwitch = false
        }
    }
    
    mutating func setPoundSwitch(_ switchValue : Bool) {
        if switchValue {
            poundSwitch = true
        } else {
            poundSwitch = false
        }
    }
    
    mutating func setAusDollarSwitch(_ switchValue : Bool) {
        if switchValue {
            ausDollarSwitch = true
        } else {
            ausDollarSwitch = false
        }
    }
    
    mutating func setCanDollarSwitch(_ switchValue : Bool) {
        if switchValue {
            canDollarSwitch = true
        } else {
            canDollarSwitch = false
        }
    }
    
}
