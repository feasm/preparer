//
//  IconViewCell.swift
//  Nano3
//
//  Created by Felipe Melo on 2/16/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class IconViewCell: UICollectionViewCell {
    // Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var selection: UIImageView!
    
    // Private
    private var nameTaskVC: NameTaskViewController!
    private var initialized = false
    
    override func didMoveToWindow() {
        if !initialized {
            addTapRecognizer()
        }
    }
    
    func setup(image: UIImage, vc: NameTaskViewController) {
        self.image.image = image
        nameTaskVC = vc
    }
    
    private func addTapRecognizer() {
        initialized = true
    }
    
    func selectIcon() {
        Animations.show(object: selection)
    }
    
    func deselectIcon() {
        Animations.hide(object: selection)
    }
}
