//
//  PostersTableViewController.swift
//  Poster
//
//  Created by Александр Панин on 20.01.2022.
//

import UIKit

class PostersTableViewController: UITableViewController {
    
    var search: String?
    var posters: Posters?

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        tableView.rowHeight = 128
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posters?.data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostersTableViewCell

        let poster = posters?.data?[indexPath.row]
        cell.configure(attribute: poster)

        return cell
    }
 
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

// MARK: - Networking

extension PostersTableViewController {
    func fetchPosters(_ sender: String) {
        NetworkingManager.shared.fetchData(url: sender) { result in
            switch result {
            case .success(let data):
                self.posters = data
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

