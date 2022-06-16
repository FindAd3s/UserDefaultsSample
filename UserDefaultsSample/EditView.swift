//
//  ViewController.swift
//  UserDefaultsSample
//
//  Created by Adrian Richton Co on 6/16/22.
//

import UIKit

class EditView: UIViewController {

    var defaults = UserDefaults.standard
    
    var array: [String] = []
    var array1: [String] = []
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var arrayView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "SampleArray1") as? [String] { // Access UserDefault
            print(items)
        }
    }

    @IBAction func enterButtonPressed(_ sender: UIButton) {
        
        if let items = defaults.array(forKey: "SampleArray1") as? [String] { // Access UserDefault
            array = items
        }
        
        self.array.append(textField1.text!)
        print(array)
        self.defaults.set(self.array, forKey: "SampleArray1") // Publish to UserDefaults
        // Change "SampleArray1" to any reference you want to use
        
        textField1.endEditing(true)
        textField1.text = ""
        
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        array = []
        print(array)
        self.defaults.set(self.array, forKey: "SampleArray1") // Publish to UserDefaults
        // Change "SampleArray1" to any reference you want to use
        
        textField1.endEditing(true)
        textField1.text = ""
        
    }
    
}

