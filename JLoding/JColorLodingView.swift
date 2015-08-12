//
//  JColorLodingView.swift
//  JLoding
//
//  Created by zpcui on 15/8/12.
//  Copyright (c) 2015年 zpcui. All rights reserved.
//

import UIKit

class JColorLodingView: UIView {
    
    var colorLayer = CAShapeLayer()
    var colorMaskLayer = CAShapeLayer()
    var blueMaskLayer = CAShapeLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var blueView = UIView(frame: bounds)
        blueView.backgroundColor = UIColor.blueColor()
        self.addSubview(blueView)
        
        setupColorLayer()
        setupBlueMaskLayer()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupColorLayer() {
        
        colorLayer.frame = self.bounds
        self.layer.addSublayer(colorLayer)
        
        var leftLayer = CAGradientLayer()
        leftLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width/2, height: self.frame.height)
        leftLayer.locations = [0.3, 0.9, 1]
        leftLayer.colors = [UIColor.yellowColor().CGColor, UIColor.greenColor().CGColor]
        colorLayer.addSublayer(leftLayer)
        
        var rightLayer =  CAGradientLayer()
        rightLayer.frame = CGRect(x: self.frame.size.width/2, y: 0, width: self.frame.size.width/2, height: self.frame.size.height)
        rightLayer.locations = [0.3, 0.9, 1]
        rightLayer.colors = [UIColor.yellowColor().CGColor, UIColor.redColor().CGColor]
        colorLayer.addSublayer(rightLayer)
        
        setupColorMaskLayer()
    }
    
    func generateMaskLayer(frame: CGRect) -> CAShapeLayer {
        
        var layer = CAShapeLayer()
        layer.frame = frame
        
        var path = UIBezierPath(arcCenter: CGPointMake(frame.width/2, frame.height/2), radius: CGFloat(frame.width/2-40), startAngle: CGFloat(-5 / 4*M_PI) , endAngle: CGFloat(1 / 4 * M_PI) , clockwise: true)
        
        layer.path = path.CGPath
        layer.lineWidth = self.frame.width/30
        layer.strokeColor = UIColor.whiteColor().CGColor
        layer.fillColor = UIColor.clearColor().CGColor
        layer.lineCap = kCALineCapRound
        
        return layer
    }
    
    func setupColorMaskLayer() {
        
        colorMaskLayer = generateMaskLayer(self.bounds)
        colorMaskLayer.lineWidth = self.frame.width/30 + 0.5
        colorMaskLayer.strokeEnd = 0
        colorLayer.mask = colorMaskLayer
        
    }
    
    func setupBlueMaskLayer() {
        blueMaskLayer = generateMaskLayer(self.bounds)
        self.layer.mask = blueMaskLayer
    }
    
    
    func setProgress(value: CGFloat) {
        
        UIView.animateWithDuration(0.5, animations: {
            self.colorMaskLayer.strokeEnd = value
        })

    }
    
}
