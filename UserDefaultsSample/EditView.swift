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
    var stringInput: String = ""
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let userArray = defaults.array(forKey: "SampleArray1") as? [String] { // Access UserDefault
            print(userArray)
            label1.text = userArray.joined(separator: ", ")
        }
        
        if let userString = defaults.string(forKey: "SampleString1") { // Access UserDefault
            print(userString)
            label2.text = userString
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
        
        label1.text = array.joined(separator: ", ")
        
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
    
    @IBAction func enterButton2Pressed(_ sender: UIButton) {
        
        stringInput = textField2.text!
        
        print(stringInput)
        self.defaults.set(self.stringInput, forKey: "SampleString1") // Publish to UserDefaults
        // Change "SampleArray1" to any reference you want to use
        
        label2.text = stringInput
        
        textField2.endEditing(true)
        textField2.text = ""
        
    }
    
    @IBAction func clearButton2Pressed(_ sender: UIButton) {
        
        stringInput = ""
        self.defaults.set(self.stringInput, forKey: "SampleString1") // Publish to UserDefaults
        // Change "SampleArray1" to any reference you want to use
        
        textField2.endEditing(true)
        textField2.text = ""
        
    }
}

