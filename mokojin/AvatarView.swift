//
//  AvatarView.swift
//  mokojin
//
//  Created by Assaf Gelber on 3/23/15.
//  Copyright (c) 2015 iicninjas. All rights reserved.
//

import Foundation
import UIKit

class AvatarView: UIImageView {
    
    var isSelected:Bool = false {
        didSet {
            if self.isSelected {
                self.layer.borderWidth = 5
                self.layer.borderColor = Constants.Colors.primaryColor.CGColor
            } else {
                self.layer.borderWidth = 0
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override init(image: UIImage!) {
        super.init(image: image)
        setup()
    }
    
    override init(image: UIImage!, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setup()
    }
    
    private func setup() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}