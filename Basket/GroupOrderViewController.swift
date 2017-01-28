//
//  GroupOrderViewController.swift
//  Basket
//
//  Created by Johanna Smith-Palliser on 1/19/17.
//  Copyright © 2017 Johanna Smith-Palliser. All rights reserved.
//

import UIKit

let WBlue = UIColor(red: 13/255, green: 104/255, blue: 184/255, alpha: 1)

class Options {
    
    var option: String
    var members: [String]
    
    init (option: String, members: [String]) {
        self.option = option
        self.members = members
    }
}

class GroupOrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var groupsTableView: UITableView!
    var options = [Options]()
    var orderNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = WBlue
        title = "Group Order"
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Arial Rounded MT Bold", size: 20)!,
            NSForegroundColorAttributeName: UIColor.white
        ]
        navigationController?.navigationBar.barStyle = UIBarStyle(rawValue: 1)!
        
        let bottomBar = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 53))
        bottomBar.center.x = view.center.x
        bottomBar.frame.origin.y = view.frame.height - bottomBar.frame.height
        bottomBar.image = UIImage(named: "bottom bar.png")
        view.addSubview(bottomBar)
        
        let findOrderLabel = UILabel(frame: CGRect(x: 0, y: 90, width: view.frame.width - 5, height: 50))
        findOrderLabel.center.x = view.center.x
        findOrderLabel.text = "   Find Someone's Order"
        findOrderLabel.backgroundColor = .white
        findOrderLabel.textColor = WBlue
        findOrderLabel.layer.borderColor = UIColor(red: 181/255, green: 195/255, blue: 204/255, alpha: 1).cgColor
        findOrderLabel.layer.borderWidth = 1.5;
        findOrderLabel.font = UIFont(name: "Arial Rounded MT", size: 20)
        findOrderLabel.layer.masksToBounds = true
        findOrderLabel.layer.cornerRadius = 8
        view.addSubview(findOrderLabel)
        
        let newGroupLabel = UILabel(frame: CGRect(x: 0, y: findOrderLabel.frame.origin.y + findOrderLabel.frame.height + 10, width: view.frame.width - 5, height: 50))
        newGroupLabel.center.x = view.center.x
        newGroupLabel.text = "Create a new Group Order"
        newGroupLabel.backgroundColor = .white
        newGroupLabel.textColor = WBlue
        newGroupLabel.font = UIFont(name: "Arial Rounded MT", size: 20)
        newGroupLabel.font = newGroupLabel.font.withSize(25)
        newGroupLabel.layer.masksToBounds = true
        newGroupLabel.layer.cornerRadius = 8
        view.addSubview(newGroupLabel)
        
        let newGroupSubLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        newGroupSubLabel.center.y = newGroupLabel.frame.origin.y + newGroupLabel.frame.height + 10
        newGroupSubLabel.center.x = view.center.x
        newGroupSubLabel.text = "     You can save up to $50"
        newGroupSubLabel.backgroundColor = .clear
        newGroupSubLabel.textColor = WBlue
        newGroupSubLabel.font = UIFont(name: "Arial Rounded MT", size: 7)
        newGroupSubLabel.font = newGroupSubLabel.font.withSize(13)
        view.addSubview(newGroupSubLabel)
        
        orderNameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 50))
        orderNameTextField.center.x = view.center.x
        orderNameTextField.center.y = newGroupSubLabel.center.y + 40
        orderNameTextField.text = "  Order Name"
        orderNameTextField.layer.borderColor = UIColor.black.cgColor
        orderNameTextField.layer.borderWidth = 1
        orderNameTextField.backgroundColor = .white
        orderNameTextField.textColor = .black
        orderNameTextField.font = UIFont(name: "Arial Rounded MT", size: 20)
        view.addSubview(orderNameTextField)
        orderNameTextField.delegate = self
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: orderNameTextField.frame.height))
        orderNameTextField.leftView = paddingView
        orderNameTextField.leftViewMode = UITextFieldViewMode.always
        orderNameTextField.returnKeyType = UIReturnKeyType.done
        // Remove keyboard on tap
        //let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissInputMediums))
        //view.addGestureRecognizer(tap)
        
        
        let plusUIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        plusUIButton.center.x = view.center.x + 150
        plusUIButton.center.y = orderNameTextField.center.y
        plusUIButton.setTitle(" + ", for: .normal)
        plusUIButton.titleLabel?.font = UIFont(name: "Arial Rounded MT", size: 45)
        plusUIButton.setTitleColor(.black, for: .normal)
        plusUIButton.backgroundColor = .clear
        plusUIButton.addTarget(self, action: #selector(addGroup), for: .touchUpInside)
        view.addSubview(plusUIButton)
        
        groupsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 10, height: 180))
        groupsTableView.center.x = view.center.x
        groupsTableView.center.y = 450
        groupsTableView.dataSource = self
        groupsTableView.delegate = self
        groupsTableView.tableFooterView = UIView()
        // Remove header
        self.automaticallyAdjustsScrollViewInsets = false
        groupsTableView.layer.masksToBounds = true
        groupsTableView.layer.borderColor = UIColor(red: 181/255, green: 195/255, blue: 204/255, alpha: 1).cgColor
        groupsTableView.layer.borderWidth = 1.0
        view.addSubview(groupsTableView)
        
        options.append(Options(option: "Family Group", members: ["Chandler", "Monica", "Ross", "Rachel", "Phoebe", "Joey"]))
        options.append(Options(option: "Office Group", members: ["Michael", "Kelly", "Jim", "Pam", "Meredith", "Dwight", "Creed", "Ryan"]))
        options.append(Options(option: "Apartment Group", members: ["Oliver", "Barry", "Iris", "Sarah", "Meredith", "Dwight", "Creed", "Ryan"]))
        options.append(Options(option: "Dorm Group", members: ["Santiago", "Ananth", "Sai", "Justin", "Johanna"]))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "A Reuse Identifier")
        cell.textLabel?.text = options[indexPath.row].option
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let group = options[indexPath.row]
        let interestsViewController = InterestsViewController()
        interestsViewController.group = group
        navigationController?.pushViewController(interestsViewController, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(viewDidDisappear))
        UINavigationBar.appearance().backIndicatorImage = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-17, 0), for: UIBarMetrics.default)
        navigationController?.navigationBar.tintColor = .white
    }
    
    func dissmissInputMediums() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        orderNameTextField.text = ""
    }
    
    func addGroup() {
        options.append(Options(option: orderNameTextField.text!, members: []))
        groupsTableView.reloadData()
        orderNameTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
