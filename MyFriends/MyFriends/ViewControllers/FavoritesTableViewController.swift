//
//  FavoritesTableViewController.swift
//  MyFriends
//
//  Created by Frank Abrams on 07.03.2021.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var newGroups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNewGroupsArray()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupsCell", for: indexPath) as! NewGroupsTableViewCell

        let item = newGroups[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = UIImage(named: item.image)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func createNewGroupsArray() {
        newGroups.append(Groups(name: "Творчество", subtitle: "Новые идеи и вдохновение", image: "handmade"))
        newGroups.append(Groups(name: "Искусство", subtitle: "Шедевры мировой классики", image: "impression"))
        newGroups.append(Groups(name: "Архитектура", subtitle: "Дизайн зданий и частных домов", image: "arch"))
        newGroups.append(Groups(name: "Автомобили", subtitle: "Последние разработки автомобилей", image: "cars"))
        newGroups.append(Groups(name: "Моделирование", subtitle: "Уроки моделирования для начинающих", image: "model"))
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
