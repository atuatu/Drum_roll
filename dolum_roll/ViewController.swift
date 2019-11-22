//
//  ViewController.swift
//  dolum_roll
//
//  Created by kiyolab02 on 2019/11/22.
//  Copyright © 2019 2019miraiketai. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    var pickerView: UIPickerView = UIPickerView()
    let list = ["", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var list_store = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRect(x: 0,y: 0,width: 0,height: 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.done))
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ViewController.cancel))
        toolbar.setItems([doneItem,flexibleItem,cancelItem], animated: true)
        self.textField.inputView = pickerView
        self.textField.inputAccessoryView = toolbar
        
    }
 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        list_store = list[row]
    }
    @objc func cancel() {
        self.textField.text = ""
        self.textField.endEditing(true)
    }
    
    @objc func done() {
        self.textField.endEditing(true)
        self.textField.text = list_store
    }
    

   


}

