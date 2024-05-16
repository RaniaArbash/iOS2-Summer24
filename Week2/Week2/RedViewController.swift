//
//  RedViewController.swift
//  Week2
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var TextInRed: UILabel!
    
    var numberFromWhiteVC : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextInRed.textColor = UIColor.white
        if let goodNum = numberFromWhiteVC {
            TextInRed.text = "The number from White VC is \(goodNum)"

        } else {
            TextInRed.text = "The number from White VC is not available"
        }
        
        // Do any additional setup after loading the view.
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
