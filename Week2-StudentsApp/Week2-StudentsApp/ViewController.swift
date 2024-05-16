//
//  ViewController.swift
//  Week2-StudentsApp
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    @IBOutlet weak var semesterPicker: UIPickerView!
    
    var listOdSemesters = ["Summer 24", "Fall 24", "Winter 25", "Summer 25"]
    
    @IBOutlet weak var stdID: UITextField!
    
    @IBOutlet weak var stdProgram: UITextField!
    
    @IBOutlet weak var stdName: UITextField!
    
    // 3- update UI and add DatePicker
    // 4- read the date from the date picker
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        semesterPicker.delegate = self
        semesterPicker.dataSource = self
    }


    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return listOdSemesters.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return listOdSemesters[row]
    }
    
    
    @IBAction func saveNewStudent(_ sender: Any) {
        
        var selectedSemesterID = semesterPicker.selectedRow(inComponent: 0)
        
        
//        guard <#condition#> else {
//            <#statements#>
//        }
        
        if let goodID = stdID.text {
            if let goodName = stdName.text {
                if let goodProgram = stdProgram.text {
                    
                    if !goodID.isEmpty {
                        if !goodName.isEmpty {
                            if !goodProgram.isEmpty {
                                if let goodInt = Int(goodID) {
                                    var newStudent = Student(ID: goodInt , name: goodName, program: goodProgram, semester: listOdSemesters[selectedSemesterID])
                                    (UIApplication.shared.delegate as! AppDelegate).allStudents.append(newStudent)
                                    clearAllFields()
                                    
                                }
                            }
                        }
                    }
                    
                    
                }
                
            }
            
        }
        
        
        
        
    }
    
    
    
    func clearAllFields(){
        
        stdID.text = ""
        stdName.text = ""
        stdProgram.text = ""
    }
}
