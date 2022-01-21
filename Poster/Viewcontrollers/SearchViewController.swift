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
    
    var posters: Posters?
    var search: String = "tokyo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        titleSearchLabel.text = """
        Введите тему для поиска
        Аниме (постеров)
        """
        
        searchTextField.text = ""
        searchTextField.becomeFirstResponder()
        searchTextField.delegate = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !checkInputText(searchTextField) { return }
        let postersVC = segue.destination as! PostersTableViewController
        postersVC.title = search
        postersVC.fetchPosters(Link.kitsuApi.rawValue + search)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) { titleSearchLabel.text = "" }
    
    @IBAction func searchButton(_ sender: UIButton) {
        if !checkInputText(searchTextField) { return }
        searchTextField.text = ""
    }
}

extension SearchViewController {
    
    // MARK: - Alert controller
    
    private func showAlert(title: String, message: String, field: UITextField ) {
        let alertView = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in field.text = "" }
        
        alertView.addAction(okAction)
        self.present(alertView, animated: true)
    }
    
    // MARK: - Check Search descripion
    
    private func checkInputText(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return falseCheck(textField) }
        guard !text.isEmpty else { return falseCheck(textField) }
        
        for character in text {
            if character < "a" || character > "z" { return falseCheck(textField) }
            }
        search = text
        return true
    }
    
    // MARK - Show Alert
    private func falseCheck(_ textField: UITextField) -> Bool {
        showAlert(title: "Пожалуйста", message: "введите Одно слово на Английском яыке без заглавных букв", field: textField)
        return false
    }
}

// MARK: - TextField controller

extension SearchViewController:  UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if checkInputText(textField) { textField.text = "" }
        return true
    }
}



