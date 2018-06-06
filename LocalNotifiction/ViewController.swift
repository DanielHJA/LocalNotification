//
//  ViewController.swift
//  LocalNotifiction
//
//  Created by Daniel Hjärtström on 2018-03-06.
//  Copyright © 2018 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var button: UIButton = {
        let temp = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        temp.center = view.center
        temp.setTitle("Notify", for: .normal)
        temp.titleLabel?.font = UIFont(name: "helvetica", size: 20.0)
        temp.setTitleColor(UIColor.blue, for: .normal)
        temp.layer.borderColor = UIColor.black.cgColor
        temp.layer.borderWidth = 1.0
        temp.addTarget(self, action: #selector(notify(sender:)), for: .touchUpInside)
        return temp
    }()
    
    private var notification: Notification = {
        return Notification()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        view.addSubview(button)
        notification.requestNotificationPermission()
    }
    
    @objc func notify(sender: UIButton) {
        notification.notify()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

