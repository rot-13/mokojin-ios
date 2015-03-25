//
//  AvatarView.swift
//  mokojin
//
//  Created by Assaf Gelber on 3/23/15.
//  Copyright (c) 2015 iicninjas. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class AvatarView: UIImageView {
    
    @IBInspectable
    var borderColor:UIColor = UIColor.clearColor() {
        didSet{
            self.layer.borderColor = self.borderColor.CGColor
        }
    }
    
    @IBInspectable
    var hasBorder:Bool = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // We need to update the radius and borderWidth on layoutSubviews because the frame width might change due to AutoLayout
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.updateCornerRadius()
        self.updateBorder()
    }
    
    private func updateCornerRadius(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.width / 2;
    }
    
    private func updateBorder(){
        self.layer.borderWidth = self.targetBorderWidth()
    }
    
    private func targetBorderWidth() -> CGFloat {
        if hasBorder {
            return AvatarView.getBorderWidth(self.layer.frame.width)
        } else {
            return 0
        }
    }
    
    func setHasBorder(hasBorder:Bool, animated:Bool=true){
        self.hasBorder = hasBorder
        if (animated){
            animateBorderWidth(self.targetBorderWidth())
        } else {
            updateBorder()
        }
    }

    class func getBorderWidth(width:CGFloat) -> CGFloat{
        return ceil(width/22.0)
    }
    
    private func animateBorderWidth(targetBorderWidth: CGFloat){
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerBorderWidth)
        animation.springBounciness = 20;
        animation.springSpeed = 20;
        animation.toValue = targetBorderWidth
        self.layer.pop_addAnimation(animation, forKey: "borderWidth")
    }
}