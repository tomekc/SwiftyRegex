//
//  SwiftyRegex.swift
//  SwiftyRegex
//
//  Created by Tomek on 06.03.2016.
//  Copyright © 2016 Tomek Cejner. All rights reserved.
//

import Foundation

public class Regex {
    let regularexpression: NSRegularExpression?
    
    public init(_ pattern: String) {
        self.regularexpression = try! NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    }
    
    public func test(input: String) -> Bool {
        if let matchCount = self.regularexpression?.numberOfMatchesInString(input, options: [], range: rangeOfString(input)) {
            return matchCount > 0
        } else {
            return false
        }
    }
    
    func rangeOfString(input:String) -> NSRange {
        return NSMakeRange(0, (input.characters.count))
    }
    
    public func matches(input: String) -> [String] {
        if let matches = self.regularexpression?.matchesInString(input, options: [], range:rangeOfString(input)) {
            
            return matches.map({ (tcr:NSTextCheckingResult) -> String in
                (input as NSString).substringWithRange(tcr.range)
            })
            
        } else {
            return []
        }
    }
    
    public func captures(input: String) -> [String] {
        if let match = self.regularexpression?.firstMatchInString(input, options: [], range: rangeOfString(input)) {
            var i = 0
            var ret:[String] = []
            while (i < match.numberOfRanges) {
                ret.append((input as NSString).substringWithRange(match.rangeAtIndex(i)))
                i++
            }
            return ret
        } else {
            return []
        }
        
    }
}

infix operator =~ {}

public func =~ (input: String, pattern: String) -> Bool {
    return Regex(pattern).test(input)
}
