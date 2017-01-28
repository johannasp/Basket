//
//  InterestsViewController.swift
//  Project 4
//
//  Created by Johanna Smith-Palliser on 10/23/16.
//  Copyright © 2016 Johanna Smith-Palliser. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var membersTableView: UITableView!
    var group: Options?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = WBlue
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Arial Rounded MT Bold", size: 20)!,
            NSForegroundColorAttributeName: UIColor.white
        ]
        navigationController?.navigationBar.barStyle = UIBarStyle(rawValue: 1)!
        
        title = " \((group?.option)!) Members"
        membersTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 300))
        membersTableView.center.x = view.center.x
        membersTableView.frame.origin.y = (navigationController?.navigationBar.frame.height)! + 50
        membersTableView.backgroundColor = .white
        membersTableView.dataSource = self
        membersTableView.delegate = self
        membersTableView.tableFooterView = UIView()
        self.automaticallyAdjustsScrollViewInsets = false
        membersTableView.layer.masksToBounds = true
        membersTableView.layer.borderColor = UIColor(red: 230/255, green: 236/155, blue: 238/255, alpha: 1).cgColor
        membersTableView.layer.borderWidth = 1.0
        membersTableView.layer.borderColor = UIColor(red: 181/255, green: 195/255, blue: 204/255, alpha: 1).cgColor
        membersTableView.layer.borderWidth = 1.5;
        view.addSubview(membersTableView)
        
        let bottomBar = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 53))
        bottomBar.center.x = view.center.x
        bottomBar.frame.origin.y = view.frame.height - bottomBar.frame.height
        bottomBar.image = UIImage(named: "bottom bar.png")
        view.addSubview(bottomBar)
        
        let addMemberUIButton = UIButton(frame: CGRect(x: 0, y: 500, width: 150, height: 50))
        addMemberUIButton.center.x = view.center.x
        addMemberUIButton.setTitle("Add Member", for: .normal)
        addMemberUIButton.setTitleColor(.white, for: .normal)
        addMemberUIButton.backgroundColor = WBlue
        addMemberUIButton.layer.cornerRadius = 5
        addMemberUIButton.layer.borderWidth = 1
        addMemberUIButton.layer.borderColor = UIColor.clear.cgColor
        addMemberUIButton.addTarget(self, action: #selector(addMember), for: .touchUpInside)
        view.addSubview(addMemberUIButton)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group!.members.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "A Reuse Identifier")
        cell.textLabel?.text = group?.members[indexPath.row]
        return cell
    }
    
    func addMember(sender: UIButton) {
        let sharingText = "Join me on SmartBasket! \n"
        
        if let theWebsite = NSURL(string: "https://www.walmart.com/SmartBasket") {
            let sharedObjects = [sharingText, theWebsite] as [Any]
            let activityVC = UIActivityViewController(activityItems: sharedObjects, applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }
    }

}
