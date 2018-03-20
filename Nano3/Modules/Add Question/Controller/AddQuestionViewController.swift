//
//  AddQuestionViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/19/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var addedNotificationView: UIView!
    
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
        hideNotifications()
        addDismissRecognizer()
    }
    
    private func addDismissRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    private func hideNotifications() {
        self.addedNotificationView.alpha = 0
    }
    
    private func hideNotification() {
        UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
            self.addedNotificationView.frame.origin.y += 50
            self.addedNotificationView.alpha = 0.0
        }) { (completed) in
            if completed {
                self.addedNotificationView.frame.origin.y -= 50
            }
        }
    }
    
    private func showNotification() {
        self.addedNotificationView.frame.origin.y += 50
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
            self.addedNotificationView.frame.origin.y -= 50
            self.addedNotificationView.alpha = 1.0
        }) { (completed) in
            if completed {
                self.hideNotification()
            }
        }
    }
    
    private func emptyFields() {
        questionTextField.text = ""
        answerTextView.text = ""
    }
    
    private func addQuestion() {
        let newQuestion = Question(question: questionTextField.text!, answer: answerTextView.text)
        
        let test = AppManager.instance.getTest()
        test.addQuestion(question: newQuestion)
    }
    
    @IBAction func doneButtonClicked(_ sender:
        UIBarButtonItem) {
        self.view.endEditing(true)
        showNotification()
        addQuestion()
        emptyFields()
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
