//
//  ViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2024-05-23.
//

import UIKit

class ViewController: UIViewController , ReadingNumberDelegateProtocol{

   
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeToRed(_ sender: Any) {
        
        view.backgroundColor = UIColor.red
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var greenVC =  segue.destination as! GreenViewController
        greenVC.delgate = self
        greenVC.number = 100
    }


    
    func readingDoneCorrectly(number: Int) {
        resultLabel.text = "Number From GVC = \(number)"
    }
    
    func readingCanceled() {
        resultLabel.text = "No number from GVC"

    }
    
    
}

