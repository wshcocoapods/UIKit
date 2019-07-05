//
//  ShClassRecordController.swift
//  StudentUI
//
//  Created by weish on 2019/6/21.
//  Copyright © 2019 bbw. All rights reserved.
//

import UIKit

class ShClassRecordController: UIViewController {

    @objc public var index = 0
//    @objc public var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = index == 0 ? UIColor.red : UIColor.blue;
        self.view.backgroundColor = color;
    }
    


}
