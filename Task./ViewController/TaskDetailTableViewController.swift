//
//  TaskDetailTableViewController.swift
//  Task.
//
//  Created by Anthony Torres on 11/13/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var task: Task? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    var dueDateValue: Date?

       
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskDueTextField.inputView = dueDatePicker
        dueDateValue = task?.due
        
        updateViews()
    }
    
    //MARK: - Actions
    
    @IBAction func savedButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text,
            let notes = taskNotesTextView.text
            else { return }
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: dueDateValue)
        } else {
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: dueDateValue)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        taskDueTextField.text = sender.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
        self.taskNotesTextView.resignFirstResponder()
    }
    
    // MARK: - Private
    
    private func updateViews() {func updateViews() {
                guard let task = task else { return }
                
                taskNameTextField.text = task.name
                taskDueTextField.text = dueDateValue?.stringValue()
                taskNotesTextView.text = task.notes
            }
        }
}
