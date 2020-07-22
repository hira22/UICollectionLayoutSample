//
//  SectionHeaderView.swift
//  UICollectionSample
//
//  Created by hiraoka on 2020/07/21.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeaderView"

    @IBOutlet var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
