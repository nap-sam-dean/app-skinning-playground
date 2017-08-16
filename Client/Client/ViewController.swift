//
//  ViewController.swift
//  Client
//
//  Created by Sam Dean on 7/13/17.
//  Copyright © 2017 Sam Dean. All rights reserved.
//

import UIKit

import Skin

class ViewController: UIViewController {

    @IBOutlet private var titleLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.title

        self.titleLabel?.font = UIFont.title
    }
}
