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
        
        DispatchQueue.global().async {
            guard let url = URL(string: attribute.posterImage?.tiny ?? "" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.tinyImage.image = UIImage(data: imageData)
                self.tinyImage.layer.cornerRadius = 20
            }
        }
    }
}
