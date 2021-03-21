//
//  ProfileTableViewController.swift
//  MyFriends
//
//  Created by Frank Abrams on 07.03.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    private var usersArray = [Friends]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUsersArray() // - создаем массив друзей с помощью отдельного метода
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count // - количество строк согласно количества элементом массива друзей
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell  // кастим для связи с файлом класса созданной ячейки
        
        let item = usersArray[indexPath.row] // вынимаем элемент из массива
        
        cell.createMyCell(item)
        return cell // возвращаем готовую ячейку
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // меняем высооту строки
        return 60.0
    }
    
    // передаем строку в буфер при нажатии для передачи в следующий контроллер по segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let buferItem = usersArray[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: buferItem)
    }
    
    // перехватываем sender от одного контроллера и отправляем в буфер другого destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let controller = segue.destination as? DetailCollectionViewController {
                let mySender = sender as? Friends
                controller.bufferItem = mySender
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            usersArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func createUsersArray() { // временно используем ручное наполнение массива друзей
        usersArray.append(Friends(firstName: "Виктория", lastName: "Иванова", picture: "user0"))
        usersArray.append(Friends(firstName: "Анатолий", lastName: "Петров", picture: "user1"))
        usersArray.append(Friends(firstName: "Дмитрий", lastName: "Сидоренко", picture: "user2"))
        usersArray.append(Friends(firstName: "Владимир", lastName: "Прокопенко", picture: "user3"))
        usersArray.append(Friends(firstName: "Светлана", lastName: "Жарова", picture: "user4"))
        usersArray.append(Friends(firstName: "Наталья", lastName: "Борисюк", picture: "user5"))
        usersArray.append(Friends(firstName: "Ирина", lastName: "Тарасюк", picture: "user6"))
        usersArray.append(Friends(firstName: "Марина", lastName: "Котляренко", picture: "user7"))
    }
    
    // unwindSegue для экрана добавления нового контакта
    @IBAction func friendsUnwindSegue(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func saveSegue(unwindSegue: UIStoryboardSegue) {
        
        guard unwindSegue.identifier == "saveSegue" else { return }
        guard let control = unwindSegue.source as? AddViewController else { return }
        let newItem = control.newFriend
        usersArray.append(newItem)
        self.tableView.reloadData()
    }
    
    
    @IBAction func addNewFriendButton(_ sender: Any) {
    }
    
}
