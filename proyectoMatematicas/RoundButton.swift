//
//  RoundButton.swift
//  proyectoMatematicas
//
//  Created by Sofia Cedillo on 31/10/18.
//  Copyright © 2018 Flor Barbosa. All rights reserved.
//

import Foundation
import  UIKit

@IBDesignable class RoundButton: UIButton{
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
        
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
        
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    
}
