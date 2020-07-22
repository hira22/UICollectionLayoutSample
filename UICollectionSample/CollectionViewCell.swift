//
//  CollectionViewCell.swift
//  UICollectionSample
//
//  Created by hiraoka on 2020/06/29.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var label: UILabel!
    static let reuseIdentifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
