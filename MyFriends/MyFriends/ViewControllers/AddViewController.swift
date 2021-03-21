//
//  AddViewController.swift
//  MyFriends
//
//  Created by Frank Abrams on 13.03.2021.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addScrollView: UIScrollView!
    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var addTableView: UITableView!
    
    let names = ["Фамилия", "Имя"]
    var newFriend = Friends(firstName: "", lastName: "", picture: "userNone")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTableView.delegate = self
        addTableView.dataSource = self
        
        // временно назначаем картинку
        addImageView.image = UIImage(named: "userNone")
        addImageView.layer.cornerRadius = addImageView.frame.height/2
        
    }
    
    @IBAction func addPhotoButton(_ sender: Any) {}
    @IBAction func saveButtonAction(_ sender: Any) {}
    
}

extension AddViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // меняем высооту строки
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as! AddTableViewCell
        cell.selectionStyle = .none
        cell.nameTextField.placeholder = names[indexPath.row]
        cell.nameTextField.tag = indexPath.row
        
        cell.nameTextField.addTarget(self, action: #selector(saveText(textField:)), for: .editingChanged)
        
        return cell
    }

    @objc func saveText(textField: UITextField) {
        if textField.tag == 0 {
            newFriend.firstName = textField.text ?? "" }
        if textField.tag == 1 {
            newFriend.lastName = textField.text ?? "" }
        
        if newFriend.firstName != "" || newFriend.lastName != "" {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false }
    }
    
    
}
