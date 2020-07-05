//
//  ViewController.swift
//  ByteCoin
//
//  Created by Nawaf B Al sharqi on 14/11/1441 AH.
//  Copyright © 1441 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var currentBitLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting dataSource
        pickerView.dataSource = self
        //setting delegate for the pickerView
        pickerView.delegate = self
        
        //setting custom delegate for updating the UI
        coinManager.delegate = self
        
    }
    
    
    
    
}

//MARK:- UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource{
    
    //    Now let’s actually provide the data and add the implementation for the first method numberOfComponents(in:) to determine how many columns we want in our picker.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //only one column
        return 1
    }
    
    //determine number of rows from the array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
}

//MARK:- UIPickerViewDelegate
extension ViewController :UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // getting the title from the array for each row
        currentBitLabel.text = coinManager.currencyArray[row]
        return coinManager.currencyArray[row]
    }
    
    // in this method will tell us which is the current selected row so from here we will perform request
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currentCurrency)
    }
}

//MARK:- CoinManagerDelegate

//custom delegate for updating the ui
extension ViewController : CoinManagerDelegate{
    func didUpdateCurrency(_ coinManager: CoinManager, currency: CurrencyModel) {
        //updating the UI
        DispatchQueue.main.async{
            self.currencyLabel.text = currency.rateString
            
        }
    }
    
    // if there is an error while parsing 
    func didFailWithError(_ coinManager: CoinManager, error: Error!) {
        if let err = error {
            print("error happen \(err)")
        }
    }
    
    
}
