//
//  GroupViewController.swift
//  SCloudNine
//
//  Created by Eddy Kim on 4/24/16.
//  Copyright © 2016 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class GroupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
        label.text = "HI"
        view.addSubview(label)
    }
}