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
import SlideMenuControllerSwift
import BEMSimpleLineGraph


class CurrencyConverter: UIViewController, BEMSimpleLineGraphDelegate, BEMSimpleLineGraphDataSource{

    
    
    
    
    
    
    var SlideInMenu = false
    @IBOutlet weak var SlideInMenuButton: UIButton!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var SlideInMenuConstraint: NSLayoutConstraint!
    
    @IBAction func currencyConverter(_ sender: UIButton) {SlideInMenuConstraint.constant = -215
        MenuView.layer.shadowOpacity = 0
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.SlideInMenuButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0)
        })
        SlideInMenu = false
    }
    func SlideIn(Test: Bool){
        if SlideInMenu == true{
            SlideInMenuConstraint.constant = -215
            MenuView.layer.shadowOpacity = 0
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.view.layoutIfNeeded()
            })
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.SlideInMenuButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0)
            })
        }
        else {
            SlideInMenuConstraint.constant = 0
            MenuView.layer.shadowOpacity = 1
            MenuView.layer.shadowRadius = 6
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.view.layoutIfNeeded()
            })
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.SlideInMenuButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
            })
        }
        SlideInMenu = !SlideInMenu}
    
    @IBAction func SlideInMenuTrigger(_ sender: UIButton) {
        SlideIn(Test: SlideInMenu)
    }
    
    @IBAction func SlideInMenuSwipeIn(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        if SlideInMenu == false{
            SlideInMenuConstraint.constant = 0
            MenuView.layer.shadowOpacity = 1
            MenuView.layer.shadowRadius = 6
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.view.layoutIfNeeded()
            })
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.SlideInMenuButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
            })
            SlideInMenu = true
        }}
    
    @IBAction func SlideInMenuSwipeOut(_ sender: UISwipeGestureRecognizer) {if SlideInMenu == true{
        SlideInMenuConstraint.constant = -215
        MenuView.layer.shadowOpacity = 0
        MenuView.layer.shadowRadius = 6
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.SlideInMenuButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0)
        })
        SlideInMenu = false
        }}

    
    
    
    
    
    
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
        selectedCurrencyValue = 0
        

    }
    
    @IBAction func converterButton(_ sender: Any) {
        if amountField.text != nil && selectedCurrencyValue != 0{resultLabel.text = String(Double(amountField.text!)! * selectedCurrencyValue)}
        
            }
    
    @IBAction func switchButton(_ sender: Any) {
        var tempResultLabel : String = ""
        var tempSelectedCurrency2 : Currency?
        var tempCurrencyButton2 : String?

        
        if resultLabel.text != nil{tempResultLabel = resultLabel.text!}

        if amountField.text != nil{resultLabel.text = amountField.text}
        if resultLabel.text != nil{amountField.text = tempResultLabel}

        if selectedCurrency1 != nil{tempSelectedCurrency2 = selectedCurrency2!}

        if selectedCurrency1 != nil{selectedCurrency2 = selectedCurrency1!}
        if selectedCurrency2 != nil{selectedCurrency1 = tempSelectedCurrency2!}
        if selectedCurrency1 != nil{tempCurrencyButton2 = currencyButton2.currentTitle}
        if selectedCurrency1 != nil{currencyButton2.setTitle(currencyButton1.currentTitle, for: .normal)}
        if selectedCurrency2 != nil{currencyButton1.setTitle(tempCurrencyButton2!, for: .normal)}


        
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
    
    
    
    @IBOutlet weak var dataCurrencyLabel: UILabel!
    func lineGraph(_ graph: BEMSimpleLineGraphView, valueForPointAt index: Int) -> CGFloat {
        let data = [1.0,2.0,3.0,2.0,0.0]
        return CGFloat(data[index] + 1)
    }
    
    func numberOfPoints(inLineGraph graph: BEMSimpleLineGraphView) -> Int {
        return 5
    }
    func lineGraph(_ graph: BEMSimpleLineGraphView, labelOnXAxisFor index: Int) -> String? {
        let label : String = String(index)
        return label
    }
    
    
    
    @IBOutlet weak var currencyGraph: BEMSimpleLineGraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDownView.anchorView = dropView!
        dropDownView.dataSource = currencyModel.currencyArray
        dropDownView2.anchorView = dropView2!
        dropDownView2.dataSource = currencyModel.currencyArray
        // Do any additional setup after loading the view.
        if selectedCurrency1?.rawValue != nil{ URL = "http://api.fixer.io/latest?base=\(selectedCurrency1!.rawValue)"}
        resultLabel.layer.cornerRadius = 5.0
        dataCurrencyLabel.layer.cornerRadius = 5.0
        let date = Date()
        let dateComponents = Calendar.current.dateComponents([.month, .day,.year], from: date)

        print(String(describing: dateComponents.year)) // may print: Optional(13)
        print(String(describing: dateComponents.day)) // may print: Optional(13)
        print(String(describing: dateComponents.month)) // may print: Optional(13)
        currencyGraph.enableYAxisLabel = true

        currencyGraph.animationGraphEntranceTime = 0.5
        currencyGraph.enableReferenceAxisFrame = true
        currencyGraph.enableReferenceXAxisLines = true
        currencyGraph.enableReferenceYAxisLines = true
        
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
