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

@objc public final class Cell: CollectionViewCell {

    public override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = UIColor(
            red: .random,
            green: .random,
            blue: .random,
            alpha: 1
        )
    }

    public override func configureCell() {
        super.configureCell()

        let label: UILabel = {
            let label: UILabel = UILabel(
                frame: CGRect(
                    origin: CGPoint(x: 16, y: 0),
                    size: self.bounds.size
                )
            )
            label.text = "\(self.datasourceItem)"
            return label
        }()

        self.addSubview(label)
    }

}

@objc public final class DS: Datasource {

    public override func cellClasses() -> [Any] {
        return [Cell.self]
    }
    
}

