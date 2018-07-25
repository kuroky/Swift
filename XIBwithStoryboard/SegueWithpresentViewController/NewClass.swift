//
//  NewClass.swift
//  SegueWithpresentViewController
//
//  Created by Carlos Butron on 13/04/15.
//  Copyright (c) 2014 Carlos Butron.
//

import UIKit

class NewClass: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dissController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
