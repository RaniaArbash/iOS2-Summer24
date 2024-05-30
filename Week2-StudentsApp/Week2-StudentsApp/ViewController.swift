//
//  ViewController.swift
//  Week2-StudentsApp
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit


protocol AddingStudentDelegateProtocol{
    func addingDidFinishedCorrectly(newStd: Student)
    func addingDidCancled()
}


class ViewController: UIViewController, UIPickerViewDelegate,  UINavigationControllerDelegate , UIImagePickerControllerDelegate,  UIPickerViewDataSource {
    
    
    @IBOutlet weak var std_img: UIImageView!
    
    var delegate:AddingStudentDelegateProtocol?
    var studentImage = UIImage(named: "nophoto")
    var std_ID: Int = 0
    var std_program = ""
    var std_name = ""
    
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
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("The user did not select any image")
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image = info[.originalImage] as? UIImage {
            std_img.image = image
            studentImage = std_img.image
            dismiss(animated: true)
        }
        
        
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        delegate?.addingDidCancled()
        dismiss(animated: true)
    }
    
    
    
    func isValidInput()->Bool {
        var isvalid = false
        if let goodID = stdID.text {
            if let goodName = stdName.text {
                if let goodProgram = stdProgram.text {
                    
                    if !goodID.isEmpty {
                        if !goodName.isEmpty {
                            if !goodProgram.isEmpty {
                                if let goodInt = Int(goodID)
                                {
                                    std_ID = goodInt
                                    std_program = goodProgram
                                    std_name = goodName
                                    isvalid = true
                                }
                            }
                        }
                    }
                }
            }
        }
        return isvalid
    }
    
    
    
    
    
    @IBAction func takeAPhoto(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        c.delegate = self
        c.allowsEditing = false
        
        present(c, animated: true, completion: nil)

    }
    
    
    
    @IBAction func pickAnImage(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = .photoLibrary
        c.delegate = self
        c.allowsEditing = false
        
        present(c, animated: true, completion: nil)

        
    }
    
    @IBAction func saveNewStudent(_ sender: Any) {
        
        let selectedSemesterID = semesterPicker.selectedRow(inComponent: 0)
        
        if (isValidInput()){
            let newStudent = Student(ID: std_ID , name: std_name, program: std_program, semester: listOdSemesters[selectedSemesterID])
            newStudent.image = studentImage
            
            delegate?.addingDidFinishedCorrectly(newStd: newStudent)
            dismiss(animated: true)
        }else {
            // display an alert
            let alert = UIAlertController(title: "Input Error!", message: "One or more value is not correct", preferredStyle: .actionSheet)
            
            let alertAction = UIAlertAction(title: "OK", style: .destructive) { alert in
                print("OK clicked")
                
            }
            let alertAction2 = UIAlertAction(title: "Cancel", style: .cancel) { alert in
                print("Cancel Clicked")
            }
            
            alert.addAction(alertAction)
            alert.addAction(alertAction2)
            present(alert, animated: true)
            
        }
        
        
    }
    
    func clearAllFields(){
        
        stdID.text = ""
        stdName.text = ""
        stdProgram.text = ""
    }
}

