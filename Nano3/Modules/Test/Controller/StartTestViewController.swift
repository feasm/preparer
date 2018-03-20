//
//  StartTestViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/19/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class StartTestViewController: UIViewController {

    // Static
    static let TEST_IDENTIFIER = "testIdentifier"
    
    // Private
    private var test: Test!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        test = AppManager.instance.getTest()
    }

    @IBAction func startTest(_ sender: UIButton) {
        test.startTest()
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: StartTestViewController.TEST_IDENTIFIER) as? TestViewController {
            vc.setup(test: test)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
