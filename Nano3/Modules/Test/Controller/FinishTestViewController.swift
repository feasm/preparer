//
//  FinishTestViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/20/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class FinishTestViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
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
        setScoreLabel()
    }
    
    private func setScoreLabel() {
        let test = AppManager.instance.getTest()
        scoreLabel.text = "Score: \(test.getCurrentScore())"
    }
    
    @IBAction func retakeTestClicked(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
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
