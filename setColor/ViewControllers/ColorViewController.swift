//
//  ColorViewController.swift
//  setColor
//
//  Created by Nataly on 10.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(color: UIColor)
}

class ColorViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colors1 = view.backgroundColor
        // инициализируем delegate типом класса
        settingsVC.delegate = self
    }
}

extension ColorViewController: SettingsViewControllerDelegate {
    //реализация метода протокола
    // здесь метод только подготовлен
    // он сработает тогда, когда будет вызван
    func setNewColor(color: UIColor) {
        view.backgroundColor = color
    }
}
