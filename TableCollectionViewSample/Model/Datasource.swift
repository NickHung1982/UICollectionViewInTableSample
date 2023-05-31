//
//  Datasource.swift
//  TableCollectionViewSample
//
//  Created by Nick on 5/29/23.
//

import Foundation
import UIKit


struct Datasource {
    var objectsArray = [TableViewCellModel]()

    init() {
        let model1 = TableViewCellModel(cellType: .singleBanner, cellItems: getRandomItems(1), cellHeight: 250)
        let model2 = TableViewCellModel(cellType: .splitBanner, cellItems: getRandomItems(2), cellHeight: 300)
        let model3 = TableViewCellModel(cellType: .collections, cellItems: getRandomItems(10), cellHeight: 200)
        
        objectsArray = [model1, model2, model3]
    }
}

private func getRandomItems(_ count: Int) -> [CellItemDetails] {
    var items = [CellItemDetails]()
    
    for i in 0..<count {
        let rnd = Int.random(in: 0..<10)
        let item = CellItemDetails(title: "title \(i)", backgroundColor: UIColor.colorFromHex(colors[rnd]))
        items.append(item)
    }
    
    return items
}


struct TableViewCellModel {
    var cellType : cellType
    var cellItems : [CellItemDetails]
    var cellHeight : CGFloat
}

struct CellItemDetails {
    var title : String
    var backgroundColor : UIColor
}

