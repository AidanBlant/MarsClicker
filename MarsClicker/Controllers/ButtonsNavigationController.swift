//
//  ButtonsNavigationController.swift
//  MarsClicker
//
//  Created by Aidan Blant on 9/5/20.
//  Copyright © 2020 Aidan Blant. All rights reserved.
//

import UIKit

class ButtonsNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        goToLab()
        perform(#selector(goToBase), with: nil, afterDelay: 2)
    }
    
    @objc public func goToBase(){
        performSegue(withIdentifier: "ToBaseSegue", sender: nil)
    }

    public func goToLab(){
        performSegue(withIdentifier: "ToLabSegue", sender: nil)
    }
    

}
