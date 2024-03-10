//
//  ViewController.swift
//  SaveMyDefaults
//
//  Created by student on 3/7/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func mySaveButton(_ sender: UIButton) {
        
        UserDefaults.standard.setValue(mySerialNumber.text , forKey: "Text")
        UserDefaults.standard.setValue(mySwitch.isOn, forKey: "Switch")
        UserDefaults.standard.setValue(mySlider.value , forKey: "Slider")
        
    }
    @IBAction func myLoadButton(_ sender: Any) {
        
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        mySerialNumber.text = UserDefaults.standard.string(forKey: "Text")
        
        
    }
    
    @IBAction func myDeleteButton(_ sender: Any) {
        
        mySwitch.isOn = true
        mySlider.value = 0.5
        mySerialNumber.text = ""
    }
    
    
    
    @IBOutlet weak var mySerialNumber: UITextField!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

