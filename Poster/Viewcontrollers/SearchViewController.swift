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
    
    var search: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSearchLabel.text = """
        Введите тему для поиска
        Анимэ(постеров)
        """
        
        searchTextField.text = ""
        searchTextField.becomeFirstResponder()
        searchTextField.delegate = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutVC = segue.destination as? AboutViewController else {return}
        aboutVC.signModel = signModel
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    @IBAction func searchButton(_ sender: UIButton) {
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
        guard let text = textField.text, !text.isEmpty else { return falseCheck(textField) } // проверка на пустое значение и введенное
        for character in text {
            if character < "a" || character > "z" { return falseCheck(textField) }
            }
        search = text
        return true
    }
    
    // MARK - Show Alert
        private func falseCheck(_ textField: UITextField) -> Bool {
            showAlert(title: "Пожалуйста",
                      message: "введите Одно слово на Английском яыке без заглавных букв",
                      field: textField)
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
        return checkInputText(textField)
    }
}



