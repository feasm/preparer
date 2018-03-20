//
//  NewTaskViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/7/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

struct TaskOptions {
    static let MORNING = TaskOption(image: #imageLiteral(resourceName: "icon-90"), type: .MORNING)
    static let AFTERNOON = TaskOption(image: #imageLiteral(resourceName: "icon-32"), type: .AFTERNOON)
    static let NIGHT = TaskOption(image: #imageLiteral(resourceName: "icon-91"), type: .NIGHT)
}

class NewTaskViewController: UIViewController {
    
    // Static
    let ROW_HEIGHT: CGFloat = 40
    
    // Outlets
    @IBOutlet weak var frequencySelectedImage: UIImageView!
    @IBOutlet weak var everyDayBtn: UIButton!
    @IBOutlet weak var everyWeekBtn: UIButton!
    @IBOutlet weak var everyMonthBtn: UIButton!
    
    @IBOutlet var daysBtns: [UIButton]!
    
    @IBOutlet weak var multipleSwitch: UISwitch!
    
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private var newTaskOptions: [TaskOption] = [
        TaskOptions.MORNING,
    ]
    private var newTaskMultipleOptions: [TaskOption] = [
            TaskOptions.MORNING,
            TaskOptions.AFTERNOON,
            TaskOptions.NIGHT
    ]
    private var isMultipleOn: Bool = false
    var newTask: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setup()
    }
    
    func createTask(name: String, image: UIImage) {
        self.newTask = Task(
            name: name,
            image: image,
            type: .EVERY_DAY,
            multiple: self.isMultipleOn,
            options: self.newTaskOptions
        )
    }
    
    private func setup() {
        self.title = "New Task"
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func everyDayClicked(_ sender: UIButton) {
        self.newTask.setType(type: .EVERY_DAY)
        
        Animations.selectOption(
            object: sender,
            selection: self.frequencySelectedImage,
            duration: Constants.ANIMATION_DURATION
        )
    }
    
    @IBAction func everyWeekClicked(_ sender: UIButton) {
        self.newTask.setType(type: .EVERY_WEEK)
        
        Animations.selectOption(
            object: sender,
            selection: self.frequencySelectedImage,
            duration: Constants.ANIMATION_DURATION
        )
    }
    
    @IBAction func everyMonthClicked(_ sender: UIButton) {
        self.newTask.setType(type: .EVERY_MONTH)
        
        Animations.selectOption(
            object: sender,
            selection: self.frequencySelectedImage,
            duration: Constants.ANIMATION_DURATION
        )
    }

    @IBAction func dayBtnClicked(_ sender: UIButton) {
        setButtonBackground(button: sender)
    }
    
    private func setButtonBackground(button: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            button.backgroundColor =
                self.isButtonActive(button) ?
                    .clear : self.frequencySelectedImage.backgroundColor
        }) { (completed) in
            if completed {
                self.newTask.setDay(name: button.currentTitle!, value: self.isButtonActive(button))
            }
        }
    }
    
    @IBAction func multipleChanged(_ sender: UISwitch) {
        self.isMultipleOn = sender.isOn
        self.newTask.setMultiple(multiple: self.isMultipleOn)
        self.newTask.setOptions(options: self.getDataSource())
        
        UIView.transition(with: self.tableView, duration: 0.2, options: [], animations: {
            self.tableView.reloadSections(IndexSet(integer: 0), with: UITableViewRowAnimation.right)
        }, completion: nil)
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        AppManager.instance.addTask(newTask)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func isButtonActive(_ button: UIButton) -> Bool {
        return button.backgroundColor == self.frequencySelectedImage.backgroundColor
    }
}

extension NewTaskViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func getDataSource() -> [TaskOption] {
        return self.isMultipleOn ? newTaskMultipleOptions : newTaskOptions
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSource = self.getDataSource()
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.ROW_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TASK_OPTION, for: indexPath) as! TaskOptionViewCell
        
        let dataSource = self.getDataSource()
        let dataObject = Builder.getObject(list: dataSource, index: indexPath.row)
        
        cell.setup(
            image: dataObject.getImage(),
            name: dataObject.getTypeValue(),
            type: dataObject.getType(),
            multipleOn: self.isMultipleOn,
            view: self
        )
        
        return cell
    }
}
