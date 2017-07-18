//
//  ViewController.swift
//  Client
//
//  Created by Sam Dean on 7/13/17.
//  Copyright © 2017 Sam Dean. All rights reserved.
//

import UIKit

import Skins

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Skinner.currentSkin.colors.primaryDark
    }
}
