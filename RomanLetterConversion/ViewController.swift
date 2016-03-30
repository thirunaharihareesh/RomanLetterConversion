//
//  ViewController.swift
//  RomanLetterConversion
//
//  Created by Hareesh Thirunahari on 3/8/16.
//  Copyright © 2016 Hareesh Thirunahari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    let dictonary:[Character: Int]  = ["I":1, "V": 5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    var number = 0
    var previousNumber = 0

    @IBOutlet weak var RomanNumberTF: UITextField!
    @IBOutlet weak var base10valueLBL: UILabel!
  
   
    
    
    override func viewDidLoad() {

        RomanNumberTF.delegate=self
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func Convert() {
        
        
                  for char in RomanNumberTF.text!.characters.reverse(){
                    let temp = dictonary[char]
                    if(temp < previousNumber){
                        number -= temp!
                    }
                    else {
                        number += temp!
                        previousNumber = temp!
                    }
                    
                }
                base10valueLBL.text=String(number)
                
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        RomanNumberTF.resignFirstResponder()
        Convert()
        return true
    }
    func textField( textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if(textField==RomanNumberTF)
        {
            let inverseSet = NSCharacterSet(charactersInString:"IVXLMCDivxlmcd").invertedSet
            
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
           
                
                let filtered = components.joinWithSeparator("")
                
                return string == filtered
            
        }
        else
        {
            return false
        }
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

