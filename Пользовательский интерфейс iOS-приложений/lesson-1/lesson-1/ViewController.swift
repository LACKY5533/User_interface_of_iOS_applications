//
//  ViewController.swift
//  lesson-1
//
//  Created by LACKY on 06.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var ScrollView: UIScrollView!
    @IBOutlet private weak var LoginText: UITextField!
    @IBOutlet private weak var PasswordText: UITextField!
    @IBOutlet private weak var ChangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGesture () {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.ScrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture() {
        self.ScrollView.endEditing(true)
    }
    
    private func addObservers() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(handleKeyboardWillShow),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(handleKeyboardWillHide),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(self,
                            name: UIResponder.keyboardWillShowNotification,
                            object: nil)
        
        NotificationCenter.default
            .removeObserver(self,
                            name: UIResponder.keyboardWillShowNotification,
                            object: nil)
    }
    
    @objc private func handleKeyboardWillShow() {
        self.ScrollView.contentInset.bottom = 120
    }
    
    @objc private func handleKeyboardWillHide() {
        self.ScrollView.contentInset.bottom = 0
    }

    @IBAction func onButtonPressed(_ sender: Any) {
        let login = LoginText.text
        let password = PasswordText.text
        
        if login == "admin" && password == "admin" {
            self.ChangeLabel.text = "Выполняется вход..."
        }else {
            self.ChangeLabel.text = "Неправильные данные!"
        }
    }
    
    }

