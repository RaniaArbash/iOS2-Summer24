//
//  ViewController.swift
//  Week2
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "togreen" {
            var GVC = segue.destination as! GreenViewController
            GVC.MessageFromWhiteVC = "This Hello is From White VC"
            
        }else if segue.identifier == "tored" {
            var RVC = segue.destination as! RedViewController
            RVC.numberFromWhiteVC = 200
            
        }
    }
    
    

}

