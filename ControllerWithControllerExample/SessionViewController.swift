//
//  SessionViewController.swift
//  ControllerWithControllerExample
//
//  Created by A1 on 29/09/2018.
//  Copyright © 2018 Home.Me. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("SessionViewController new init")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        // check
        print("SessionViewController deinit")
    }

}
