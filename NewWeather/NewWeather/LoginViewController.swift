//
//  LoginViewController.swift
//  NewWeather
//
//  Created by Frank Abrams on 07.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        loginScrollView?.contentInset = contentInsets
    }
    
    // Исчезновение клавиатуры
    @objc func hideKeyboard() {
        self.loginScrollView?.endEditing(true)
    }

    //MARK: - Жизненный цикл View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        // Присваиваем его UIScrollVIew
        loginScrollView?.addGestureRecognizer(hideKeyboardGesture)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Выводит сообщение об ошибке
    func showErrorMessage() {
        
        let alert = UIAlertController(title: "Внимание!", message: "Вы ввели неверные логин или пароль", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel) { handler in
            self.passwordTextField.text = ""
            self.loginTextField.text = ""
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Проверка правильности пароля перед переходом
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        switch identifier {
        
        case "loginSeque":
                        
            if loginTextField.text == "admin" && passwordTextField.text == "123456" {
                return true
            } else {
                showErrorMessage()
                return false
            }
        default:
            return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        }
    }

    //MARK: - Actions
    @IBAction func loginButtonPressed(_ sender: Any) { }
    
    // Обнуление полей логина и пароля при выходе из профиля
    @IBAction func loginUnwindSegue(unwindSegue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
}
