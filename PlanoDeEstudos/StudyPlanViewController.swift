//
//  StudyViewController.swift
//  PlanoDeEstudos
//
//  Created by Eric Brito
//  Copyright © 2017 Eric Brito. All rights reserved.

import UIKit

class StudyPlanViewController: UIViewController {

    @IBOutlet weak var tfCourse: UITextField!
    @IBOutlet weak var tfSection: UITextField!
    @IBOutlet weak var dpDate: UIDatePicker!
    
    var sm = StudyManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dpDate.minimumDate = Date()
    }

    @IBAction func schedule(_ sender: UIButton) {
        if let course = tfCourse.text,
           let section = tfSection.text {
            let id = "\(Date().timeIntervalSince1970)"
            let studyPlan = StudyPlan(course: course, section: section, date: dpDate.date, done: false, id: id)
            
            sm.addPlan(studyPlan)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
