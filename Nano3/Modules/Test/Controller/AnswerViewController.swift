//
//  AnswerViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/21/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    // Outlets
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    // Private
    private var testVC: TestViewController!
    private var test: Test!
    private var userAnswer: String = ""
    private var correctAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup(userAnswer: userAnswer, correctAnswer: correctAnswer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(test: Test, userAnswer: String, correctAnswer: String, testVC: TestViewController) {
        self.test = test
        self.userAnswer = userAnswer
        self.correctAnswer = correctAnswer
        self.testVC = testVC
        
        let tapRecognizer =
            UITapGestureRecognizer(
                target: self,
                action: #selector(dismissKeyboard)
        )
        
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    private func setup(userAnswer: String, correctAnswer: String) {
        userAnswerLabel.text = userAnswer
        correctAnswerLabel.text = correctAnswer
    }
    
    private func close() {
        testVC.getNextQuestion()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rightClicked(_ sender: Any) {
        test.addPoint()
        close()
    }
    
    @IBAction func wrongClicked(_ sender: Any) {
        close()
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
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
