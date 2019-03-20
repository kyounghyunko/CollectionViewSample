//
//  SampleCollectionViewCell.swift
//  CollectionSample
//
//  Created by ko on 2019/01/16.
//  Copyright © 2019年 ko. All rights reserved.
//

import UIKit

final class SampleCollectionViewCell: UICollectionViewCell {
    
    static let kCellIdentifier = "SampleCollectionViewCell"
    
    var thumbnail: UIImage? {
        didSet {
            self.thumbnailImageView.image = self.thumbnail
        }
    }
    var labelText: String = "" {
        didSet {
            self.sampleLabel.text = self.labelText
        }
    }
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var sampleLabel: UILabel!
    
    @IBOutlet private weak var viewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.viewWidthConstraint.constant = UIScreen.main.bounds.size.width / 2 - 8 * 2
    }
    
}
