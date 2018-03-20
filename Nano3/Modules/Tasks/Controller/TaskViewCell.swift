//
//  TaskViewCell.swift
//  Nano3
//
//  Created by Felipe Melo on 2/6/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(_ task: Task) {
        self.taskImage.image = task.getImage()
        self.taskTitle.text = task.getName()
        self.taskTime.text = task.getType().rawValue
    }
}
