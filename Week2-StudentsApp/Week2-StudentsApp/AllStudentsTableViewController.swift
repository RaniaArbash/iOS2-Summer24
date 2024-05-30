//
//  RedTableViewController.swift
//  Week2-StudentsApp
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class AllStudentsTableViewController: UITableViewController, AddingStudentDelegateProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ViewController
        vc.delegate = self
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).allStudents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 8
        
        cell.stdName.text = (UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].name
        
        cell.stdID.text = "\((UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].ID)"
       
        cell.stdProgram.text = (UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].program
        
        cell.stdImage.image = (UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].image
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func addingDidFinishedCorrectly(newStd: Student) {
        (UIApplication.shared.delegate as! AppDelegate).allStudents.append(newStd)
        tableView.reloadData()
    }
    
    func addingDidCancled() {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var mes = "\((UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].ID) - \((UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].name) - \((UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].program) - \((UIApplication.shared.delegate as! AppDelegate).allStudents[indexPath.row].semester)"
        
        let alert = UIAlertController(title: "Student Info", message:
                                        mes
                                      , preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .destructive) { alert in
            print("OK clicked")
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
