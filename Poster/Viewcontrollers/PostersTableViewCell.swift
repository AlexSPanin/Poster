//
//  PostersTableViewCell.swift
//  Poster
//
//  Created by Александр Панин on 20.01.2022.
//

import UIKit

class PostersTableViewCell: UITableViewCell {

    @IBOutlet var tinyImage: UIImageView!
    @IBOutlet var descripionLabel: UILabel!
    
    func configure(attribute: Attributes?) {
        guard let attribute = attribute?.attributes else { return }
        descripionLabel.text = attribute.title
        
        NetworkingManager.shared.fetchImage(url: attribute.posterImage?.tiny ?? "") { result in
            switch result {
            case .success(let data):
                self.tinyImage.image = UIImage(data: data)
                self.tinyImage.layer.cornerRadius = 20
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
