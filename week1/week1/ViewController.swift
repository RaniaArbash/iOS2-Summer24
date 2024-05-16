//
//  ViewController.swift
//  week1
//
//  Created by Rania Arbash on 2024-05-09.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var calculationTable: UITableView!
    
    
    var calculationArray = [String]()
    
    var counter: Int? = 9
    var number1: Int = 0
    var number2 : Int = 0
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var secondNumberText: UITextField!
    
    @IBOutlet weak var firstNumberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculationTable.delegate = self
        calculationTable.dataSource = self
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    func isValid()->Bool{
        var isvalid = false
        if let goodNumber = firstNumberText.text{
            if !goodNumber.isEmpty {
                if let goodNumber2 = secondNumberText.text
                {
                    if !goodNumber2.isEmpty {
                        let num1 = Int(goodNumber)
                        let num2 = Int(goodNumber2)
                        if let goodNum1 = num1 {
                            if let goodNum2 = num2 {
                                number1 = goodNum1
                                number2 = goodNum2
                                isvalid = true
                                
                            }
                        }
                    }
                }
            }
        }
        return isvalid
    }
    
    
    
    
    @IBAction func clearBut(_ sender: Any) {
        resultLabel.text = ""
        firstNumberText.text = ""
        secondNumberText.text = ""
        
    }
    
    
    @IBAction func op(_ sender: UIButton) {
        // if
        var title = sender.titleLabel?.text
        var result : Int = 0
        if isValid() {
            switch title{
            case "+":
                result = number1 + number2
                break
            case "-":
                result = number1 - number2
                break
            case .none:
                break
            case .some(_):
                break
            }
            var calculation = "\(number1) \(title!) \(number2) = \(result)"
            calculationArray.append(calculation)
            calculationTable.reloadData()
            resultLabel.text = "\(result)"
        }else {
            resultLabel.text = "Incorrect Input!!"
        }
    }
        
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return calculationArray.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell()
        cell.textLabel?.text = calculationArray[indexPath.row]
        return cell
    }
    
    }


