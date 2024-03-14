//
//  ViewController.swift
//  ByteCoin
//
//  Created by Иван Семенов on 13.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()
    let mainView = CoinView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        mainView.picker.dataSource = self
        mainView.picker.delegate = self
        coinManager.delegate = self
        
    }
}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}
extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.mainView.сurrencyPriceLabel.text = price
            self.mainView.сurrencyPairLabel.text = currency
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
