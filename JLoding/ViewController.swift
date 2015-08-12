//
//  ViewController.swift
//  JLoding
//
//  Created by zpcui on 15/8/12.
//  Copyright (c) 2015年 zpcui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lodingView = JColorLodingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        var frame = CGRectMake(self.view.frame.width/2, self.view.frame.height/2, 400, 400)
        lodingView = JColorLodingView(frame: frame)
        lodingView.center = self.view.center
        self.view.addSubview(lodingView)
        
        var slider = UISlider(frame: CGRectMake(0, 0 , 200, 20))
        slider.center = self.view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0;
        slider.addTarget(self, action: "slideValueChange:", forControlEvents:.ValueChanged )
        self.view.addSubview(slider)
    }

    func slideValueChange(slide: UISlider) {
        lodingView.setProgress(CGFloat(slide.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

