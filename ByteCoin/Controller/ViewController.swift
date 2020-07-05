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
        pickerView.dataSource = self
        pickerView.delegate = self
        coinManager.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

//MARK:- UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource{
    
    //    Now let’s actually provide the data and add the implementation for the first method numberOfComponents(in:) to determine how many columns we want in our picker.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //only one column
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //number of rows from the array
        return coinManager.currencyArray.count
    }
    
    
}

//MARK:- UIPickerViewDelegate
extension ViewController :UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // getting the title from the array for each row
        
        return coinManager.currencyArray[row]
    }
    
    // in this method will tell us which is the current selected row so from here we will perform request
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currentCurrency)
    }
}

extension ViewController : CoinManagerDelegate{
    func didUpdateCurrency(_ coinManager: CoinManager, currency: CurrencyModel) {
        print(currency.rate)
    }
    
    func didFailWithError(_ coinManager: CoinManager, error: Error!) {
        if let err = error {
            print("error happen \(err)")
        }
    }
    
    
}
