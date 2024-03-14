//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Иван Семенов on 13.03.2024.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "34B018F8-71E8-4E2A-A1FB-08AEF7160256"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let coinData = data {
                    let btcPrice = parseJSON(coinData)
                    let priceStr = String(format: "%.1f", btcPrice!)
                    delegate?.didUpdatePrice(price: priceStr, currency: currency)
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ data: Data) -> Double? {
        let decoder =  JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let rate = decodedData.rate
            print("--> \(rate)")
            return rate
        } catch {
            print(error)
            return nil
        }
    }
}

