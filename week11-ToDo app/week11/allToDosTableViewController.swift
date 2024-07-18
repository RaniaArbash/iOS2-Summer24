//
//  allToDosTableViewController.swift
//  week11
//
//  Created by Rania Arbash on 2024-07-18.
//

import UIKit

class allToDosTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfToDoFromCoredata = [ToDo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTable()
        searchBar.delegate = self

            }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDoFromCoredata.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listOfToDoFromCoredata[indexPath.row].task

        return cell
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count != 0 {
            listOfToDoFromCoredata = CoreDataManager.shared.getToDo(text: searchText)
            tableView.reloadData()
            
        }else {
            
            updateTable()
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
         return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Deleting!!!", message: "Are you sure you want to delete this task", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive,handler: { action in
                CoreDataManager.shared.deleteOneToDo(tobeDeleted: self.listOfToDoFromCoredata[indexPath.row])
                self.updateTable()
                
                
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
    
            present(alert, animated: true)
        }
    }
    

    
    
    @IBAction func addNewTodo(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add New ToDo", message: "Enter the new task", preferredStyle: .alert)
        
        
        var textField = UITextField()
        alert.addTextField { alertText in
            alertText.placeholder = "Enter the new Task Here"
            textField = alertText
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default,handler: { action in
            // insert to coredata
            if let goodtask = textField.text {
                CoreDataManager.shared.addNewToDo(t: goodtask, isUrgent: true)
                self.updateTable()
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
        present(alert, animated: true)
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let alert = UIAlertController(title: "Update ToDo", message: "Update your task", preferredStyle: .alert)
        
        
        var textField = UITextField()
        textField.text = self.listOfToDoFromCoredata[indexPath.row].task
        
        alert.addTextField { alertText in
            alertText.text = self.listOfToDoFromCoredata[indexPath.row].task
          
            textField = alertText
            
        }
        
        alert.addAction(UIAlertAction(title: "Update", style: .default,handler: { action in
            // insert to coredata
            if let goodtask = textField.text {
                CoreDataManager.shared.updateToDo(tobeupdatedToDo: self.listOfToDoFromCoredata[indexPath.row], newtask: goodtask)
                self.updateTable()
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
        present(alert, animated: true)
    
        
        
    }
    
    func updateTable(){
        
        listOfToDoFromCoredata = CoreDataManager.shared.getAllToDos()
        tableView.reloadData()
        
    }
    
    
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
