//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Nawaf B Al sharqi on 14/11/1441 AH.
//  Copyright © 1441 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    //https://rest.coinapi.io/v1/exchangerate?apikey=AD339BB8-F2BD-49C6-81DB-5163F2DE2774/AUD
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BCD/"
    let apiKey = "AD339BB8-F2BD-49C6-81DB-5163F2DE2774"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    
    func getCoinPrice(for currency:String){
        let urlString = "\(baseURL)\(currency)?apikey=\(apiKey)&"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        //first step create a URL
        if let url = URL(string: urlString){
            //now creating url session
            let session = URLSession(configuration: .default)
            
            //lets create task
            let task = session.dataTask(with: url) { (data, response, error) in
               //checking if there is an error 
                if  error != nil {
                    print("error found : \(error!)")
                    return
                }
                //checking if the data is safe
                if let currencyData = data {
                    print(currencyData)
                    return
                }
                
            }
            
            //starting the http task
            task.resume()
        }
        }
    
    
}
