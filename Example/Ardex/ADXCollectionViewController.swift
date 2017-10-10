//
//  ADXCollectionViewController.swift
//  Ardex_Example
//
//  Created by Harry Wright on 10.10.17.
//  Copyright © 2017 harrytwright. All rights reserved.
//

import UIKit
import Ardex

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

@objc public final class Cell: ADXCollectionViewCell {

    public override func setupViews() {
        self.backgroundColor = UIColor(
            red: .random,
            green: .random,
            blue: .random,
            alpha: 1
        )
    }

}

@objc public final class DS: Datasource {

    public override func cellClasses() -> [Any] {
        return [Cell.self]
    }
    
}

