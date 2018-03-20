//
//  TaskOptionViewCell.swift
//  Nano3
//
//  Created by Felipe Melo on 2/8/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class TaskOptionViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionName: UILabel!
    
    @IBOutlet weak var optionSelection: UIImageView!
    @IBOutlet weak var optionYes: UIButton!
    @IBOutlet weak var optionNo: UIButton!
    
    // Variables
    private var type: TaskOptionType!
    private var newTaskVC: NewTaskViewController!
    private var multipleOn: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(image: UIImage, name: String, type: TaskOptionType, multipleOn: Bool, view: NewTaskViewController) {
        self.optionImage.image = image
        self.optionName.text = name
        self.type = type
        self.multipleOn = multipleOn
        self.newTaskVC = view
        
        self.mountView()
    }
    
    @IBAction func optionYesClicked(_ sender: UIButton) {
        self.newTaskVC.newTask.setOption(type: type, value: true)
        
        Animations.selectOption(object: sender, selection: self.optionSelection, duration: Constants.ANIMATION_DURATION)
    }
    
    @IBAction func optionNoClicked(_ sender: UIButton) {
        self.newTaskVC.newTask.setOption(type: type, value: false)
        
        Animations.selectOption(object: sender, selection: self.optionSelection, duration: Constants.ANIMATION_DURATION)
    }
    
    private func mountView() {
        if !self.multipleOn && !self.isMultipleType() {
            self.hideButtons()
        }
        
        if self.multipleOn && self.isMultipleType() {
            Animations.selectOption(object: self.optionYes, selection: self.optionSelection, duration: 0)
        }
        
        if !self.canSelectRow() {
            self.selectionStyle = .none
        }
    }
    
    private func hideButtons() {
        self.optionSelection.isHidden = true
        self.optionYes.isHidden = true
        self.optionNo.isHidden = true
    }
    
    private func canSelectRow() -> Bool {
        return !self.isMultipleType() && !self.multipleOn
    }
    
    private func isMultipleType() -> Bool {
        return self.optionName.text == TaskOptionType.MULTIPLE.rawValue
    }
}
