//
//  AddBottomLine.swift
//  LovePub
//
//  Created by Xie Liwei on 06/08/2017.
//  Copyright © 2017 Xie Liwei. All rights reserved.
//

import Foundation
import UIKit

func addBottomLineForView (view:UIView, color : UIColor, height:CGFloat){
    
    let viewBottom = UIView(frame: CGRect(x: 0, y: height - 1.0, width: view.frame.width, height: 0.5))
    viewBottom.backgroundColor = color
    viewBottom.setNeedsLayout()
    view.addSubview(viewBottom)
    view.bringSubview(toFront: viewBottom)
    
}
