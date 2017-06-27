//
//  ViewController.swift
//  FIRQuickstart
//
//  Created by User01 on 27/06/17.
//  Copyright © 2017 User01. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var sunnyButton: UIButton!
    @IBOutlet weak var foggyButton: UIButton!
    
    let conditionRef = Database.database().reference().child("condition")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        conditionRef.observe(.value) { (snap: DataSnapshot) in
            self.conditionLabel.text = snap.value as? String
        }
    }
    @IBAction func sunnyDidTouch(_ sender: Any) {
        conditionRef.setValue(sunnyButton.titleLabel?.text)
    }
    @IBAction func foggyDidTouch(_ sender: Any) {
        conditionRef.setValue(foggyButton.titleLabel?.text)
    }

    /**
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    **/

}

