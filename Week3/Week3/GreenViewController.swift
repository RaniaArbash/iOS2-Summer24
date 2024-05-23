//
//  GreenViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2024-05-23.
//

import UIKit

protocol ReadingNumberDelegateProtocol {
    func readingDoneCorrectly(number: Int)
    func readingCanceled()
}


class GreenViewController: UIViewController {

    
    @IBOutlet weak var numberText: UITextField!
    
    
    var delgate: ReadingNumberDelegateProtocol?
    
    var number = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendBack(_ sender: Any) {
        if let goodNumber =  numberText.text{
            if !goodNumber.isEmpty {
                if let goodInt = Int(goodNumber)
                {
                    delgate?.readingDoneCorrectly(number: goodInt)
                    dismiss(animated: true)
                }
            }
            
        }
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        
        delgate?.readingCanceled()
        dismiss(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
