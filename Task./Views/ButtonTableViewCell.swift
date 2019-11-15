//
//  ButtonTableViewCell.swift
//  Task.
//
//  Created by Anthony Torres on 11/13/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonTableViewCell: UITableViewCell {

    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    // MARK: Private
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    // MARK: Properties
    
    var delegate: ButtonTableViewCellDelegate?
    
    
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var primaryLabel: UILabel!
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
