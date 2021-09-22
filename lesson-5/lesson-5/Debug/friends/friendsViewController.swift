//
//  friendsViewController.swift
//  lesson-3
//
//  Created by LACKY on 13.09.2021.
//

import UIKit

class friendsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var FriendsItem: [FriendsDisplayItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.Nib.basic, forCellReuseIdentifier: R.Cell.basic)
        self.getData()
    }
    
    private func getData() {
        
        let mockItems: [FriendsDisplayItem] = [
            .init(friend: "Лиза"),
            .init(friend: "Кирилл"),
            .init(friend: "Артём"),
            .init(friend: "Катя"),
            .init(friend: "Дима")]
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.FriendsItem = mockItems
            self.tableView.reloadData()
        }
    }
    
}

extension friendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FriendsItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.Cell.basic, for: indexPath)
    }
}

extension friendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? BasicTableViewCell)?.configure(with: self.FriendsItem[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            FriendsItem.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
}
