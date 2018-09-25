//
//  ViewController.swift
//  PickerExample
//
//  Created by Tony Vazgar on 9/24/18.

//  Copyright © 2018 Tony Vazgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pickerData = NSMutableArray()
    let path = Bundle.main.path(forResource: "Fruits", ofType: "plist")

    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerData = NSMutableArray(contentsOfFile: path!)!
        print(pickerData)
        picker.dataSource = self
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (pickerData[row] as! String)
    }
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let alert = UIAlertController(title: "Selected", message: (pickerData[picker.selectedRow(inComponent: 0)] as! String), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}









