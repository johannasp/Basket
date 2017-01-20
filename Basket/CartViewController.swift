//
//  ViewController.swift
//  Basket
//
//  Created by Johanna Smith-Palliser on 1/19/17.
//  Copyright © 2017 Johanna Smith-Palliser. All rights reserved.
// Bleeeeeep

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "screenshot.png")!)
        
        let background = UIImage(named: "screenshot.png")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)

        
        
    }

}

