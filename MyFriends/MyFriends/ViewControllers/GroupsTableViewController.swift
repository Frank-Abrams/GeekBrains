//
//  GroupsTableViewController.swift
//  MyFriends
//
//  Created by Frank Abrams on 07.03.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var groupsArray = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGroupsArray()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsTableViewCell
        let item = groupsArray[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = UIImage(named: item.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func createGroupsArray() {
        groupsArray.append(Groups(name: "Спорт", subtitle: "Последние новости мира спорта", image: "sport"))
        groupsArray.append(Groups(name: "Музыка", subtitle: "Новинки отечественного шоубизнеса", image: "music"))
        groupsArray.append(Groups(name: "Кино", subtitle: "Знаменательные события мира кинематографа", image: "movies"))
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
    
    

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
    
    @IBAction func backToGroups(unwindsegue: UIStoryboardSegue) {
        
        if unwindsegue.identifier == "BackToGroups" {
            
            let controller = unwindsegue.source as! FavoritesTableViewController
            
            if let indexPath = controller.tableView.indexPathForSelectedRow {
                let item = controller.newGroups[indexPath.row]
                if !groupsArray.contains(item) {
                    groupsArray.append(item)
                }
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func favoritesButton(_ sender: Any) {
    }
    
}

