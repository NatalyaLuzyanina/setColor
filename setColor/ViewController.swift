//
//  ViewController.swift
//  setColor
//
//  Created by Nataly on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorLable: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLable: UILabel!
    @IBOutlet var greenValueLable: UILabel!
    @IBOutlet var blueValueLable: UILabel!
    
    @IBOutlet var redTextLabel: UILabel!
    @IBOutlet var greenTextLabel: UILabel!
    @IBOutlet var blueTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Color label
        colorLable.layer.cornerRadius = 10
        
        // Red slider
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
        // Green slider
        greenSlider.value = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
        // Blue slider
        blueSlider.value = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        
        // Text labels
        redTextLabel.text = "Red"
        greenTextLabel.text = "Green"
        blueTextLabel.text = "Blue"
    }
    
    
    @IBAction func setColor() {
        
        redValueLable.text = String(format:"%.2f", redSlider.value)
        greenValueLable.text = String(format:"%.2f", greenSlider.value)
        blueValueLable.text = String(format:"%.2f", blueSlider.value)
        
        colorLable.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

