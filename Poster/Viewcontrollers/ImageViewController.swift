//
//  ImageViewController.swift
//  Poster
//
//  Created by Александр Панин on 21.01.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var fullImage: UIImageView!
    
    var url: PosterImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullImage.layer.cornerRadius = 20
        NetworkingManager.shared.fetchImage(url: url?.original ?? "") { result in
            switch result {
            case .success(let data):
                self.fullImage.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
