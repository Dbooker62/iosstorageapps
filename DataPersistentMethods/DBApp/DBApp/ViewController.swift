//
//  ViewController.swift
//  DBApp
//
//  Created by student on 3/8/24.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    var dataManager: NSManagedObjectContext!
    var listArray = [NSManagedObject]()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var displayDataHere: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        fetchData()
    }
    
    @IBAction func saveRecordButton(_ sender: UIButton) {
        guard let nameText = nameTextField.text, !nameText.isEmpty,
              let emailText = emailTextField.text, !emailText.isEmpty else {
            print("Name or Email is empty")
            return
        }
        
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Item", into: dataManager)
        newEntity.setValue(nameText, forKey: "name")
        newEntity.setValue(emailText, forKey: "email")
        
        do {
            try self.dataManager.save()
            listArray.append(newEntity)
            fetchData()
        } catch {
            print("Error saving Data")
        }
    }
    
    @IBAction func deleteRecordButton(_ sender: UIButton) {
        guard let deleteItem = nameTextField.text, !deleteItem.isEmpty else {
            print("Name is empty")
            return
        }
        
        for item in listArray {
            if let itemName = item.value(forKey: "name") as? String, itemName == deleteItem {
                dataManager.delete(item)
                if let index = listArray.firstIndex(of: item) {
                    listArray.remove(at: index)
                }
            }
        }
        
        do {
            try self.dataManager.save()
            fetchData() 
        } catch {
            print("Error Deleting Data")
        }
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        do {
            let result = try dataManager.fetch(fetchRequest)
            listArray = result as! [NSManagedObject]
            displayDataHere.text = listArray.map { ($0.value(forKey: "name") as? String) ?? "" }.joined(separator: "\n")
        } catch {
            print("Error retrieving data!")
        }
    }
}

