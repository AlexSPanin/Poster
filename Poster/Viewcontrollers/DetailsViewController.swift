//
//  DetailesViewController.swift
//  Poster
//
//  Created by Александр Панин on 21.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var originalImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var attribute: Attribute?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = attribute?.slug ?? "Details"
        descriptionLabel.text = attribute?.synopsis ?? "Description"
        originalImage.layer.cornerRadius = 20
        NetworkingManager.shared.fetchImage(url: attribute?.posterImage?.original ?? "") { result in
            switch result {
            case .success(let data):
                self.originalImage.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    


    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let url = attribute?.posterImage else { return }
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.url = url
        imageVC.title = title
    }
}
