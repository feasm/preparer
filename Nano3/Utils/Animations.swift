//
//  Animations.swift
//  Nano3
//
//  Created by Felipe Melo on 2/8/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class Animations {
    static let SLOW: CGFloat = 1.0
    static let NORMAL = 0.5
    static let FAST = 0.25
    
    static func selectOption(object: UIView, selection: UIView, duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: SLOW, initialSpringVelocity: 0, options: [], animations: {
            selection.frame.origin.x = object.frame.origin.x + object.superview!.frame.origin.x
        }) { (completed) in
            
        }
    }
    
    static func flipView(view: UIView) {
        UIView.transition(with: view, duration: NORMAL, options: UIViewAnimationOptions.transitionFlipFromTop, animations: {
            view.backgroundColor = UIColor.gray
        }, completion: { (completed) in
            
        })
    }
    
    static func flipView(cell: UIView, tableView: UITableView, indexPath: IndexPath) {
        UIView.transition(with: cell, duration: NORMAL, options: UIViewAnimationOptions.transitionFlipFromTop, animations: {
            cell.backgroundColor = UIColor.gray
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        }, completion: { (completed) in
            
        })
    }
    
    static func show(object: UIView) {
        UIView.animate(withDuration: FAST) {
            object.alpha = 1
        }
    }
    
    static func hide(object: UIView) {
        UIView.animate(withDuration: FAST) {
            object.alpha = 0
        }
    }
}
