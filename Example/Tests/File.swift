//
//  File.swift
//  Ardex
//
//  Created by Harry Wright on 13.07.17.
//  Copyright © 2017 harrytwright. All rights reserved.
//

import Ardex

class datasource : Datasource {
    
    override var collectionCellClasses: [Any] {
        return []
    }
    
    override var numberOfSections: Int {
        return objects.count
    }
    
    override func numberOfItems(in section: Int) -> Int {
        return objects.count
    }
    
    override func item(at indexPath: IndexPath) -> Any {
        return objects[indexPath.row]
    }
}
