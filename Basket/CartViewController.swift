//
//  ViewController.swift
//  Basket
//
//  Created by Johanna Smith-Palliser on 1/19/17.
//  Copyright © 2017 Johanna Smith-Palliser. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImage(named: "screenshot.png")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        let groupOrderButton = UIButton(frame: CGRect(x: 0, y: 475, width: 330, height: 48))
        groupOrderButton.center.x = view.center.x
        groupOrderButton.setBackgroundImage(UIImage(named: "group order button.png"), for: .normal)
        groupOrderButton.addTarget(self, action: #selector(goToGroupOrderViewController), for: .touchUpInside)
        view.addSubview(groupOrderButton)
    }
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
 
    func goToGroupOrderViewController() {
        navigationController?.pushViewController(GroupOrderViewController(), animated: true)
        print("test")
    }
    
    // Remove navigation bar from login/sign up screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // Put back navigation bar once you leave this view so it shows up on all other views
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
