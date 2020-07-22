//
//  SelectionCell.swift
//  UICollectionSample
//
//  Created by hiraoka on 2020/06/29.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import UIKit

// TODO: UN_USED
class SelectionCell: UICollectionViewCell {
    @IBOutlet private var checkbox: UIImageView!
    @IBOutlet private var label: UILabel!
    
    override var isSelected: Bool {
        didSet {
             configureCheckbox()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCheckbox()
    }
    
    
    func configureCheckbox() {
        self.checkbox.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle")
    }

}

