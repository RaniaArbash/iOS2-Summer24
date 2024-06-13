//
//  CitiesTableViewController.swift
//  WeatherApp-iOS2
//
//  Created by Rania Arbash on 2024-06-13.
//

import UIKit

class CitiesTableViewController: UITableViewController, UISearchBarDelegate, NetworkingDelegate {

    @IBOutlet weak var searchbar: UISearchBar!
    var citiesList = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        NetworkingService.shared.delegate = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(citiesList[indexPath.row].name), \(citiesList[indexPath.row].state), \(citiesList[indexPath.row].country)"

        return cell
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        // start the search
        
        if (searchText.count >= 3){
             NetworkingService.shared.getCitiesFromAPI(searchText: searchText)
        }else {
            citiesList = [City]()
            tableView.reloadData()
            
        }
        
    }
    
    
    func networkingDidFinishWithCityList(cities : [City]){
        citiesList = cities
        tableView.reloadData()
    }
    
    func networkingDidFail() {
        
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
