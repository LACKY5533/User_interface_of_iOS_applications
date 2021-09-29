//
//  friendsViewController.swift
//  lesson-2
//
//  Created by LACKY on 11.09.2021.
//

import UIKit

class friendsViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let indentifier = "MyFriends"
    
    var mas = ["Лиза", "Дима", "Катя", "Артём", "Кирилл", "Женя", "Андрей"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension friendsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friends = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        
        let number = mas[indexPath.row]
        friends.textLabel?.text = number
        
        return friends
    }
    
}
