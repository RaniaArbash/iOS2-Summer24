//
//  GreenViewController.swift
//  Week2
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var textInGreen: UILabel!
    
    var MessageFromWhiteVC : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInGreen.text = MessageFromWhiteVC
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMain(_ sender: Any) {
        
        self.dismiss(animated: true)
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
