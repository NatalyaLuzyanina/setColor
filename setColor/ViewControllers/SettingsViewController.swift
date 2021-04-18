//
//  ViewController.swift
//  setColor
//
//  Created by Nataly on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorLable: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLable: UILabel!
    @IBOutlet var greenValueLable: UILabel!
    @IBOutlet var blueValueLable: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var colors1: UIColor!
    
    // св-во протокола
    var delegate: SettingsViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLable.backgroundColor = colors1
        // задаем начальное состояние экрана
        setSlider()
        redTF.text = string(from: redSlider)
        greenTF.text = string(from: greenSlider)
        blueTF.text = string(from: blueSlider)
        
        redValueLable.text = redTF.text
        greenValueLable.text = greenTF.text
        blueValueLable.text = blueTF.text
        // скругляем углы вьюшки в которой будем менять цвет
        colorLable.layer.cornerRadius = 10
    }
    
    // функция срабатывает, когда юзер двигает ползунок слайдера
    // на вход принимает значение ползунка
    // вызывается сетКолор, которая изменяет цвет вьюшки в соответствии с переданным значением слайдера
    // далее с помощью свитча передаем новое значение слайдера в соответствующий лейбл и преобразуем их в краткий формат
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redValueLable)
            setValueTF(for: redTF)
        case greenSlider: setValue(for: greenValueLable)
            setValueTF(for: greenTF)
        default: setValue(for: blueValueLable)
            setValueTF(for: blueTF)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(color: colorLable.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    // изменяет цвет вьюшки
    // в соответствии с текущими значениями слайдеров
    private func setColor() {
        colorLable.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    // выстраивает слайдеры в соответствии с цветом вьюшки
    private func setSlider() {
        let ciColor = CIColor(color: colors1)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value =  Float(ciColor.green)
        blueSlider.value =  Float(ciColor.blue)
    }
        
    // принимает значения лейблов и преобразует их в краткий формат
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLable:
                label.text = string(from: redSlider)
            case greenValueLable:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValueTF(for textfields: UITextField...) {
        textfields.forEach { textfield in
            switch textfield {
            case redTF:
                redTF.text = string(from: redSlider)
            case greenTF:
                greenTF.text = string(from: greenSlider)
            default:
                blueTF.text = string(from: blueSlider)
            }
        }
    }
    
    //сокращаем числовые значения до двух знаков после запятой
    private func string(from slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
}



