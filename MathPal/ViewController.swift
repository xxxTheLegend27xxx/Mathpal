//
//  ViewController.swift
//  MathPal
//
//  Created by Nicolaj Thomsen on 02/07/2017.
//  Copyright © 2017 Nicolaj Thomsen. All rights reserved.
//

import UIKit






class ViewController: UIViewController {
    
   
    

    var SlideInMenu = false
    @IBOutlet weak var SlideInMenuButton: UIButton!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var SlideInMenuConstraint: NSLayoutConstraint!
    
    @IBAction func Calculator(_ sender: UIButton) {SlideInMenuConstraint.constant = -215
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
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var Solution: UILabel!
    
    var Calc: Double = 0 // Calculation 1 - tallet der altid vises i Solution.text
    var Calc2: Double = 0 // Calculation 2 - gemmer Calc's værdi til at udfører den ønskede Calculation
    var Calc3: Double = 0 // bruges til at resultatknappen kan blive ved med at regne
    var K: Double = 10 // variable der ændre værdien af input til at vise et ønsket tal
    var D = false // Division /
    var M = false // Multipikation *
    var S = false // Subtraction -
    var A = false // Addition +
    var Dot = false // Punktum .
    var V: Double = 1 // variablen der ændrer N systematiske handlinger efter, for det meste efter punktum er blevet presset
    var C = false // Om AC -> C værdien
    var PM = false // Plus minus knappen
    var V2: Double = 1 // bruges til at holde V's værdi
    var Percent = false // Bool der checker om procent knappen er blevet trykket på
    var Null = false // variable der bruges til at se, om et tal har påtaget sig en action
    var DotStr = true // variable der bruges til at konvertere decimaltal til + og -
    var DotPM: String = "" // en string der bruges til at konvertere decimaltal til +-
    var SolutionLength: Int = 0 // checker var lang tallet er i solution.text
    var ActionCheck = false // Bool der checker om en handling er påtaget
    var ResultAction = true // Checker om Result handling er deaktiveret
    let CharacterLength = 9 // max længde a tegn inde i Solution.text
    var ResultBCheck = false // checker om result knappen er blevet presset
    // bruges til at highlighte handlingsknapperne
    @IBOutlet weak var MB: UIButton! // outlet til  gange
    @IBOutlet weak var DB: UIButton! // outlet til divedere
    @IBOutlet weak var SB: UIButton! // outlet til minus
    @IBOutlet weak var AB: UIButton! // outlet til plus
   // bruges til at konvertere AC -> C
    @IBOutlet weak var ACB: UIButton! // outlet til AC
    
    
    //    tester om en handling er activeret og viser brugeren om handling er aktiveret
    func TestH(H: Bool) -> CGFloat{
        var T: CGFloat = 1
        if H == true{
            T = 0.75
        } else {
            T = 1
        }
        return T
    }
    // funktion der bruges til at checke om en handling er påtaget sig
    func ATest(Handling: Bool) -> Bool{
        var Handling: Bool = false
        if D == true || M == true || S == true || A == true || ResultAction == true
        {
            Handling = true
            ResultAction = false
        } else {
            Handling = false
            ResultAction = false
        }
        return Handling
    }
   
    func Number(NumberValue: Double){
        if ResultBCheck == true{ResultBFunc()}
        if NumberValue == 0 {
        ActionCheck = ATest(Handling: ActionCheck)
        SolutionLength = Solution.text!.characters.count
        if SolutionLength <= 3 {ActionCheck = false}
        if SolutionLength <= CharacterLength || ActionCheck == true && Null == false{
            
            
            Null = true
            
            if Percent == true{
                Calc = 0
                PM = false
                V = 1
                V2 = 1
                Percent = false
                K = 10
                Dot = false
            }
            
            if Dot == true{
                V = V * 10
                V2 = V
                K = 1
                
            }
            else {
                V = V2
                K = 10
            }
            
            Calc = Calc * K + (NumberValue/V)
            if Dot == true {
                if DotStr == true{
                    Solution.text = String(Calc)
                    DotStr = false
                }
                else {
                    Solution.text = Solution.text! + String(Int(NumberValue))
                    
                }
            }
            else if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }
            
            MB.alpha = 1
            DB.alpha = 1
            SB.alpha = 1
            AB.alpha = 1
            
            
            ACB.setTitle("C", for: .normal)
        }
        else{}
        }
        if NumberValue != 0{
            ActionCheck = ATest(Handling: ActionCheck)
            SolutionLength = Solution.text!.characters.count
            if SolutionLength <= 3 {ActionCheck = false}
            if SolutionLength <= CharacterLength || ActionCheck == true && Null == false{
                
                Null = true
                
                if Percent == true{Calc = 0
                    PM = false
                    V = 1
                    V2 = 1
                    Percent = false
                    K = 10
                    Dot = false
                    // Dette er hvis man allerede har klikket på procent og derefter klikker videre, så reseter det bare tallet
                }
                
                if Dot == true{
                    V = V * 10
                    V2 = V
                    K = 1
                    DotStr = false
                }
                    //  Dette ændre systemmet vedr. hvordan den tæller op, når man har klikket på punktum knappen/deci
                else {
                    V = V2
                    K = 10
                }
                
                // Det sidste tjekker om tallet har nogen decimaltal, og hvis det ikke har det ændre det værdien fra double til int
                
                Calc = Calc * K + (NumberValue/V)
                if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                    Solution.text = String(Int(Calc))
                }
                else {
                    Solution.text = String(Calc)
                }
                
                MB.alpha = 1
                DB.alpha = 1
                SB.alpha = 1
                AB.alpha = 1
                
                
                
                ACB.setTitle("C", for: .normal)

            }}}
    func ResultBFunc(){
        Calc3 = 0
        Dot = false
        V = 1
        V2 = 1
        D = false
        M = false
        S = false
        A = false
        PM = false
        Null = false
        ActionCheck = true
        ResultBCheck = false
        MB.alpha = 1
        DB.alpha = 1
        SB.alpha = 1
        AB.alpha = 1
        ACB.setTitle("C", for: .normal)}
    func Action(){
        if ResultBCheck == true{ResultBFunc()}
        if Null == true{
        if D == true {
            Calc = Calc2/Calc
            Calc2 = Calc
            if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }
        }
        if M == true {
            Calc = Calc2*Calc
            Calc2 = Calc
            if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }
        }
        if S == true {
            Calc = Calc2-Calc
            Calc2 = Calc
            if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }
        }
        if A == true{
            Calc = Calc2+Calc
            Calc2 = Calc
            if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }}}}
    func Action2(){
        ResultBCheck = false
        if Calc2 == 0 && ActionCheck == false{
            Calc2 = Calc
            Calc = 0
        }
        Calc = 0
        Dot = false
        V = 1
        PM = false
        V2 = 1
        Null = false
        ActionCheck = true
        ACB.setTitle("C", for: .normal)
}
    func Action3(){
        MB.alpha = TestH(H: M)
        DB.alpha = TestH(H: D)
        SB.alpha = TestH(H: S)
        AB.alpha = TestH(H: A)
    }

    @IBAction func N0(_ sender: UIButton) {
        Number(NumberValue: 0)
           }
    @IBAction func N1(_ sender: UIButton) {
        Number(NumberValue: 1)
    }
    @IBAction func N2(_ sender: UIButton) {
       Number(NumberValue: 2)
    }
    @IBAction func N3(_ sender: UIButton) {
        Number(NumberValue: 3)
    }
    @IBAction func N4(_ sender: UIButton) {
       Number(NumberValue: 4)
    }
    @IBAction func N5(_ sender: UIButton) {
        Number(NumberValue: 5)
    }
    @IBAction func N6(_ sender: UIButton) {
       Number(NumberValue: 6)
    }
    @IBAction func N7(_ sender: UIButton) {
        Number(NumberValue: 7)
    }
    @IBAction func N8(_ sender: UIButton) {
        Number(NumberValue: 8)
    }
    @IBAction func N9(_ sender: UIButton) {
        Number(NumberValue: 9)
    }
    @IBAction func AC(_ sender: UIButton) {
        if ResultBCheck == true{ResultBFunc()}
        if Calc != 0{
            Calc = 0
            Calc3 = 0
            ResultBCheck = false
            Dot = false
            V = 1
            V2 = 1
            PM = false
            Dot = false
            DotStr = true
            DotPM = ""
            Solution.text = String(Int(Calc))
            ACB.setTitle("AC", for: .normal)
        }
        else{
            ACB.setTitle("AC", for: .normal)
            Calc = 0
            Calc2 = 0
            Calc3 = 0
            if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }
            ResultAction = false
            ResultBCheck = false
            ActionCheck = false
            
            Null = false
            D = false
            M = false
            S = false
            A = false
            Dot = false
            PM = false
            V = 1
            V2 = 1
            Percent = false
            DotStr = true
            DotPM = ""
            MB.alpha = 1
            DB.alpha = 1
            SB.alpha = 1
            AB.alpha = 1
        }
    }
    @IBAction func PlusMinus(_ sender: UIButton) {
        ResultBCheck = false
        if PM == true {
            PM = false
            Calc = Calc * (-1)
            V = (-1) * V2
            V2 = V
        }
        else {
            PM = true
            Calc = Calc * (-1)
            V = (-1) * V2
            V2 = V
        }
        if DotStr == false && PM == true{
            DotPM = Solution.text!
            Solution.text = "-" + Solution.text!
        }
        else if DotStr == false && PM == false{
            Solution.text = DotPM
        }
        else if Calc == 0 && PM == true {
            Solution.text = "-" + String(Int(Calc))
        }
        else if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
            Solution.text = String(Int(Calc))
        }
        else {
            Solution.text = String(Calc)
        }
        
    }
    @IBAction func Percent(_ sender: UIButton) {
        ResultBCheck = false
        
        Calc = Calc / 100
        if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
            Solution.text = String(Int(Calc))
        }
        else {
            Solution.text = String(Calc)
            
        }
        
        Percent = true
        ACB.setTitle("C", for: .normal)
    }
    
    @IBAction func DotB(_ sender: UIButton) {
        ResultBCheck = false
        if Dot == false{
            Dot = true
            Solution.text = String(Int(Calc)) + "."
            
        }
        else{
        }
        ACB.setTitle("C", for: .normal)
    }
    
    
    @IBAction func Division(_ sender: UIButton) {
        if Null == false && ActionCheck == true{
        D = true
        M = false
        S = false
        A = false
        }
        else if Null == true{Action()}
        Action2()
        D = true
        M = false
        S = false
        A = false
        Action3()
    }
    @IBAction func Multiplication(_ sender: UIButton) {
        if Null == false && ActionCheck == true{
        D = false
        M = true
        S = false
        A = false
    }
    else if Null == true{Action()}
        Action2()
        D = false
        M = true
        S = false
        A = false
        Action3()
    }
    @IBAction func Subtraction(_ sender: UIButton) {
        if Null == false && ActionCheck == true{
        D = false
        M = false
        S = true
        A = false
        }
        else if Null == true{Action()}
        Action2()
        D = false
        M = false
        S = true
        A = false
        Action3()
    }
    @IBAction func Addition(_ sender: UIButton) {if Null == false && ActionCheck == true{
        D = false
        M = false
        S = false
        A = true
    }
    else if Null == true{Action()}
        Action2()
        D = false
        M = false
        S = false
        A = true
        Action3()
    }
    @IBAction func Result(_ sender: UIButton) {
        ResultAction = true
        if ResultBCheck == false{
        if D == true {
            Calc3 = Calc
            Calc = Calc2 / Calc
            Calc2 = Calc
        }
        if M == true {
            Calc3 = Calc
            Calc = Calc2 * Calc
            Calc2 = Calc
        }
        if S == true {
            Calc3 = Calc
            Calc = Calc2 - Calc
            Calc2 = Calc
        }
        if A == true {
            Calc3 = Calc
            Calc = Calc2 + Calc
            Calc2 = Calc
        }
        
        if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
            Solution.text = String(Int(Calc))
        }
        else {
            Solution.text = String(Calc)
        }
        ActionCheck = true
        MB.alpha = 1
        DB.alpha = 1
        SB.alpha = 1
        AB.alpha = 1
        ResultBCheck = true}
        else{
            if D == true {
                Calc = Calc2 / Calc3
                Calc2 = Calc
            }
            if M == true {
                Calc = Calc2 * Calc3
                Calc2 = Calc
            }
            if S == true {
                Calc = Calc2 - Calc3
                Calc2 = Calc
            }
            if A == true {
                Calc = Calc2 + Calc3
                Calc2 = Calc
            }
            if (Calc*2).truncatingRemainder(dividingBy: 2) == 0{
                Solution.text = String(Int(Calc))
            }
            else {
                Solution.text = String(Calc)
            }
            Null = false
            ActionCheck = true
            MB.alpha = 1
            DB.alpha = 1
            SB.alpha = 1
            AB.alpha = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MB.titleLabel!.minimumScaleFactor = 0.5;
        MB.titleLabel!.adjustsFontSizeToFitWidth = true;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



