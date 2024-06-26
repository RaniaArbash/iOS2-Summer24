//
//  ColorsTableViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class ColorsTableViewController: UITableViewController {

    // UIColor(_colorLiteralRed: 78, green: 92, blue: 115, alpha: 0.4)
    var colorsList : [ColorModel] = [ ColorModel(n: "Red",c: UIColor(red: 87, green: 92, blue: 115, alpha: 1)),
                                      ColorModel(n: "Green",c: UIColor.green),
                                      ColorModel(n: "Blue",c: UIColor.blue),
                                      ColorModel(n: "Pink",c: UIColor.systemPink),
                                      ColorModel(n: "Black",c: UIColor.black)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = colorsList[indexPath.row].colorName
        
        
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       var cvc = segue.destination as! ColorViewController
    
        cvc.colorFromFirstViewController = colorsList[(tableView.indexPathForSelectedRow?.row)!]
    }
    

}
