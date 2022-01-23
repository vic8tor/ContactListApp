//
//  ContactListViewController.swift
//  ContactListApp
//
//  Created by Victor on 22.01.2022.
//

import UIKit

class ContactListViewController: UITableViewController {
   
    // MARK: - @IBOutlets
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var users: [User] = []
    // MARK: - Initializers
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadUsers()
        print(users)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let name = users[indexPath.row].name
        
        content.text = name?.first
        content.secondaryText = users[indexPath.row].phone
        
        cell.contentConfiguration = content
        return cell
     }


    // MARK: - @IBActions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    private func downloadUsers() {
        NetworkManager.shared.fetchUsers { result in
            switch result {
            case .success(let users):
                self.users = users
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
    // MARK: - Table view data source

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

