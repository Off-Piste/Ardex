//
//  NSArray+Nested.swift
//  Ardex
//
//  Created by Harry Wright on 17.10.17.
//

import Foundation

/// Added due to [... isKindOf:[NSArray class]]
/// does not take into account the internal Generic
/// value so for now will add this extension to handle
/// the middle work
///
///:nodoc:
@objc extension NSArray {

    ///:nodoc:
    @objc public var isNestedArray: Bool {
        if self is [[Any]] { return true }
        return false
    }

    @objc public func flatern() -> NSArray {
        if self.isNestedArray {
            return (self as! ([[Any]])).reduce([], +) as NSArray
        }

        return self
    }

}
