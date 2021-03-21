//
//  SettingsTableViewController.swift
//  MyFriends
//
//  Created by Frank Abrams on 07.03.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let settingsArray = ["Основные", "Учетная запись", "Внешний вид"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        cell.textLabel?.text = settingsArray[indexPath.row]
        return cell
    }

}
