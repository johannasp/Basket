//
//  GroupOrderViewController.swift
//  Basket
//
//  Created by Johanna Smith-Palliser on 1/19/17.
//  Copyright © 2017 Johanna Smith-Palliser. All rights reserved.
//

import UIKit

let WBlue = UIColor(red: 13/255, green: 104/255, blue: 184/255, alpha: 1)

class RDCell: UICollectionViewCell {
    
}

class GroupOrderViewController: UIViewController  {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = WBlue
        title = "Group Order"
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Arial Rounded MT Bold", size: 20)!,
            NSForegroundColorAttributeName: UIColor.white
        ]
        navigationController?.navigationBar.barStyle = UIBarStyle(rawValue: 1)!
        
        let findOrderLabel = UILabel(frame: CGRect(x: 0, y: 90, width: view.frame.width, height: 50))
        findOrderLabel.center.x = view.center.x
        findOrderLabel.text = "   Find Order"
        findOrderLabel.backgroundColor = .white
        findOrderLabel.textColor = WBlue
        findOrderLabel.layer.borderColor = UIColor.black.cgColor;
        findOrderLabel.layer.borderWidth = 1.5;
        findOrderLabel.font = UIFont(name: "Arial Rounded MT", size: 20)
        view.addSubview(findOrderLabel)
        
        let newGroupLabel = UILabel(frame: CGRect(x: 0, y: findOrderLabel.center.y + findOrderLabel.frame.height, width: view.frame.width, height: 50))
        newGroupLabel.center.x = view.center.x
        newGroupLabel.text = "   Create a new Group Order"
        newGroupLabel.backgroundColor = .white
        newGroupLabel.textColor = WBlue
        newGroupLabel.font = UIFont(name: "Arial Rounded MT", size: 20)
        view.addSubview(newGroupLabel)
        
        let newGroupSubLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        newGroupSubLabel.center.y = newGroupLabel.center.y + newGroupLabel.frame.height
        newGroupSubLabel.center.x = view.center.x
        newGroupSubLabel.text = "     You can save up to $50"
        newGroupSubLabel.backgroundColor = .white
        newGroupSubLabel.textColor = WBlue
        newGroupSubLabel.font = UIFont(name: "Arial Rounded MT", size: 7)
        view.addSubview(newGroupSubLabel)
        
        let whiteLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        whiteLabel.center.y = newGroupSubLabel.center.y + newGroupSubLabel.frame.height
        whiteLabel.center.x = view.center.x
        whiteLabel.text = "     You can save up to $50"
        whiteLabel.backgroundColor = .white
        whiteLabel.textColor = WBlue
        whiteLabel.font = UIFont(name: "Arial Rounded MT", size: 7)
        view.addSubview(whiteLabel)
        
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 40))
        textField.center.x = view.center.x
        textField.center.y = newGroupSubLabel.center.y + newGroupSubLabel.frame.height
        textField.backgroundColor = .white
        textField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(textField)
        
    }
    
    func setupCollectionView () {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        view.addSubview(collectionView)
    }

}
