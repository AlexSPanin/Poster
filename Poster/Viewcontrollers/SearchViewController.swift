//
//  ViewController.swift
//  Poster
//
//  Created by Александр Панин on 20.01.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var titleSearchLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSearchLabel.text = "Введите тему для поиска \nАнимэ(постеров)"
    }

    @IBAction func searchButton(_ sender: UIButton) {
    }
    
}

