//
//  File.swift
//  RSCustomBrowser
//
//  Created by iOS Developer on 05/09/18.
//  Copyright © 2018 iOS Developer. All rights reserved.
//

import UIKit

class LoaderView: UIView {

    
/*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBehavior()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func addBehavior() {
        print("Add all the behavior here")
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 50, height: 50))

    }
    
    
    
//    override func draw(_ rect: CGRect) {
//
//    }
//
    
    
}
