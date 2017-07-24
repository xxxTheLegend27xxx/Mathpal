//
//  CurrencyConverter.swift
//  MathPal
//
//  Created by Povl Klarlund on 23/07/2017.
//  Copyright © 2017 Nicolaj Thomsen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import DropDown


class CurrencyConverter: UIViewController {

    var URL : String = ""
    let currencyModel = CurrencyModel()
    let dropDownView = DropDown()
    let dropDownView2 = DropDown()
    var selectedCurrency1 : Currency?
    var selectedCurrency2 : Currency?
    var selectedCurrencyValue : Double = 0
    var currencyJSON : JSON?
    
    @IBOutlet weak var dropView: UIView!
    @IBOutlet weak var dropView2: UIView!
    @IBOutlet weak var currencyButton1: UIButton!

    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var currencyButton2: UIButton!
    
    
    @IBAction func currency1(_ sender: UIButton) {
        dropDownView.show()
        
        dropDownView.selectionAction = { [unowned self] (index, item) in
            self.currencyButton1.setTitle(item, for: .normal)
            if self.dropDownView.selectedItem != nil{self.selectedCurrency1 = Currency(rawValue: self.dropDownView.selectedItem!)}
            self.URL = "http://api.fixer.io/latest?base=\(self.selectedCurrency1!.rawValue)"
            self.getCurrencyData(url: self.URL)
        }
        
    }
    
    @IBAction func currency2(_ sender: UIButton) {
        dropDownView2.show()
        dropDownView2.selectionAction = { [unowned self] (index, item) in
        self.currencyButton2.setTitle(self.dropDownView2.selectedItem!, for: .normal)
            if self.dropDownView2.selectedItem != nil{self.selectedCurrency2 = Currency(rawValue: self.dropDownView2.selectedItem!)}
            if self.currencyJSON != 0 {
                self.selectedCurrencyValue = self.currencyJSON!["rates"]["\(self.selectedCurrency2!)"].doubleValue
            }
        }
        
        
    }
    
    @IBAction func acButton(_ sender: Any) {
        currencyButton1.setTitle("Select Currency", for: .normal)
        currencyButton2.setTitle("Select Currency", for: .normal)
        amountField.text = ""
        resultLabel.text = ""
        

    }
    
    @IBAction func converterButton(_ sender: Any) {
        if amountField.text != nil{resultLabel.text = String(Double(amountField.text!)! * selectedCurrencyValue)}
        
            }
    
    @IBAction func switchButton(_ sender: Any) {
        if amountField.text != nil{resultLabel.text = amountField.text}
        if resultLabel.text != nil{amountField.text = resultLabel.text}
        if selectedCurrency1 != nil{selectedCurrency2 = selectedCurrency1!}
        if selectedCurrency2 != nil{selectedCurrency1 = selectedCurrency2!}
        if selectedCurrency1 != nil{currencyButton2.setTitle(currencyButton1.currentTitle, for: .normal)}
        if selectedCurrency2 != nil{currencyButton1.setTitle(currencyButton2.currentTitle, for: .normal)}


        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDownView.anchorView = dropView!
        dropDownView.dataSource = currencyModel.currencyArray
        dropDownView2.anchorView = dropView2!
        dropDownView2.dataSource = currencyModel.currencyArray
        // Do any additional setup after loading the view.
        if selectedCurrency1?.rawValue != nil{ URL = "http://api.fixer.io/latest?base=\(selectedCurrency1!.rawValue)"}
        resultLabel.layer.cornerRadius = 5.0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getCurrencyData(url: String){
        
        
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess{
                print("boi")
                self.currencyJSON = JSON(response.result.value!)
                self.updateCurrencyData(json: self.currencyJSON!)
                
                
                
            }
            else{
                print("Error \(response.result.error)")
            }
        }
        
    }
    
    
    
    
    
    
    func updateCurrencyData(json : JSON){
        
        let baseResult = json["base"].stringValue
        currencyModel.base = baseResult
        currencyModel.CNY = json["rates"]["CNY"].doubleValue
        currencyModel.PLN = json["rates"]["PNL"].doubleValue
        currencyModel.THB = json["rates"]["THB"].doubleValue
        currencyModel.BGN = json["rates"]["BGN"].doubleValue
        currencyModel.AUD = json["rates"]["AUD"].doubleValue
        currencyModel.SEK = json["rates"]["SEK"].doubleValue
        currencyModel.ILS = json["rates"]["ILS"].doubleValue
        currencyModel.BRL = json["rates"]["BRL"].doubleValue
        currencyModel.DKK = json["rates"]["DKK"].doubleValue
        currencyModel.GBP = json["rates"]["GBP"].doubleValue
        currencyModel.RUB = json["rates"]["RUB"].doubleValue
        currencyModel.CHF = json["rates"]["CHF"].doubleValue
        currencyModel.MXN = json["rates"]["MXN"].doubleValue
        currencyModel.HRK = json["rates"]["HRK"].doubleValue
        currencyModel.RON = json["rates"]["RON"].doubleValue
        currencyModel.TRY = json["rates"]["TRY"].doubleValue
        currencyModel.SGD = json["rates"]["SGD"].doubleValue
        currencyModel.NOK = json["rates"]["NOK"].doubleValue
        currencyModel.HUF = json["rates"]["CNY"].doubleValue
        currencyModel.NZD = json["rates"]["CNY"].doubleValue
        currencyModel.USD = json["rates"]["USD"].doubleValue
        currencyModel.MYR = json["rates"]["MYR"].doubleValue
        currencyModel.IDR = json["rates"]["IDR"].doubleValue
        currencyModel.KRW = json["rates"]["KRW"].doubleValue
        currencyModel.JPY = json["rates"]["JPY"].doubleValue
        currencyModel.INR = json["rates"]["INR"].doubleValue
        currencyModel.PHP = json["rates"]["PHP"].doubleValue
        currencyModel.CZK = json["rates"]["CZK"].doubleValue
        currencyModel.HKD = json["rates"]["HKD"].doubleValue
        currencyModel.ZAR = json["rates"]["ZAR"].doubleValue
        currencyModel.CAD = json["rates"]["CAD"].doubleValue



    }


}
