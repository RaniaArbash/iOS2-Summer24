//
//  ViewController.swift
//  Week5-Networking
//
//  Created by Rania Arbash on 2024-06-06.
//

import UIKit

class ViewController: UIViewController , NetworkingDelegate  {
   

    var apiStudentData = Model()
    var index = 0
    @IBOutlet weak var studetnName: UILabel!
    
    @IBOutlet weak var NumberOfCourses: UILabel!
    
    @IBOutlet weak var courseName: UILabel!
    
    
    @IBOutlet weak var coursCode: UILabel!
    
    
    @IBOutlet weak var courseImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let networkingService = NetworkingService()
       
        networkingService.delegate = self
        
        networkingService.getCoursedDataFromAPI()
        
        // Do any additional setup after loading the view.
    }

    func networkingDidFinishWithModel(studentData: Model) {
        studetnName.text = studentData.student
        NumberOfCourses.text = "\(studentData.count)"
        coursCode.text = studentData.data[index].courseCode
        courseName.text = studentData.data[index].courseName
        downloadImage()
        apiStudentData = studentData
    
    }
    
    func networkingDidFail() {
        studetnName.text = "Data is Not available!!"
    }
    
func downloadImage(){
    var myQ = DispatchQueue(label: "myq")
    myQ.async {// create and start a background thread to download the image
        do{
            var imageData = try Data(contentsOf: URL(string: self.apiStudentData.data[self.index].image)!)
            
            // we come back to main thread to update the UI.
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
                
            }
        }
        catch {
            print(error)
        }
    }
}
    



    @IBAction func nextCourse(_ sender: Any) {
        index += 1
        if (index == apiStudentData.count){
            index = 4
            coursCode.text = apiStudentData.data[index].courseCode
            courseName.text = apiStudentData.data[index].courseName
            downloadImage()
        }else {
            coursCode.text = apiStudentData.data[index].courseCode
            courseName.text = apiStudentData.data[index].courseName
            downloadImage()
        }
      
    }
    
    
    @IBAction func prevCourseClick(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = 0
            coursCode.text = apiStudentData.data[index].courseCode
            courseName.text = apiStudentData.data[index].courseName
            downloadImage()
        }
        else {
            coursCode.text = apiStudentData.data[index].courseCode
            courseName.text = apiStudentData.data[index].courseName
            downloadImage()
        }
    }
    
}

