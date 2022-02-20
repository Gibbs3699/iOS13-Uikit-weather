//
//  ViewController.swift
//  iOS13-Uikit-weather
//
//  Created by admin on 19/2/2565 BE.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
    }
    
}

