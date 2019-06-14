//
//  TasksViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/6/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit
import AWSAppSync

class TasksViewController: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Properties
    var appSyncClient: AWSAppSyncClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func runMutation(){
        let mutationInput = CreateTodoInput(name: "Use AppSync", description:"Realtime and Offline")
        appSyncClient?.perform(mutation: CreateTodoMutation(input: mutationInput)) { [weak self] (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                return
            }
            
            self?.runQuery()
        }
    }
    
    func runQuery(){
        appSyncClient?.fetch(query: ListTodosQuery(), cachePolicy: .returnCacheDataAndFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            result?.data?.listTodos?.items!.forEach { print(($0?.name)! + " " + ($0?.description)! + "\n") }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
        runQuery()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        setupTableView()
    }
    
    @IBAction func addTaskBtnPressed(_ sender: Any) {
//        runMutation()
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AppManager.instance.getTasksCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TASK, for: indexPath) as! TaskViewCell
        
        let task = AppManager.instance.getTask(index: indexPath.section)
        cell.setup(task)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.CELL_PADDING
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let ignore = UITableViewRowAction(style: .normal, title: "Ignore") { (action, index) in
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TASK, for: indexPath)
            
            Animations.flipView(cell: cell, tableView: tableView, indexPath: indexPath)
        }
        
        return [ignore]
    }
}
