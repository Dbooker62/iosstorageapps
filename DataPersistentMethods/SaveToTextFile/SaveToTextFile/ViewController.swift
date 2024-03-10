//
//  ViewController.swift
//  SaveToTextFile
//
//  Created by student on 3/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBAction func writeMyText(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("FileText")
        do
        {
            try typeTextHere.text?.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        }
        catch{
            print("error writing file")
        }
    }
    
    
    @IBAction func saveMyText(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("FileText")
        do{
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
            
            
        }
        catch
        {
            print("Error Reading File!")
        }
        
        
        
    }
    
    
   
    @IBOutlet weak var typeTextHere: UITextView!
    
    
    
    @IBOutlet weak var displayTextHere: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        typeTextHere.text = "Type your new text right Here"
        displayTextHere.text = ""
    }


}

