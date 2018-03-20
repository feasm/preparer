//
//  TestViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/19/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    // Static
    let FINISH_IDENTIFIER = "finishIdentifier"
    let ANSWER_IDENTIFIER = "answerIdentifier"
    
    // Outlets
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    
    // Private
    private var test: Test!
    private var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getNextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(test: Test) {
        self.test = test
    }
    
    func getNextQuestion() {
        if let question = test.getNextQuestion() {
            questionLbl.text = question.getQuestion()
            answerTextView.text = ""
            self.question = question
        } else {
            finishTest()
        }
    }
    
    private func finishTest() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: FINISH_IDENTIFIER) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: ANSWER_IDENTIFIER) as? AnswerViewController {
            vc.modalPresentationStyle = .overCurrentContext
            vc.setup(
                test: test,
                userAnswer: answerTextView.text,
                correctAnswer: question!.getCorrectAnswer(),
                testVC: self
            )
            present(vc, animated: true, completion: nil)
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
