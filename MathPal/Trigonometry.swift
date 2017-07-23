//
//  Trigonometry.swift
//  MathPal
//
//  Created by Nicolaj Thomsen on 10/07/2017.
//  Copyright © 2017 Nicolaj Thomsen. All rights reserved.
//

import UIKit

class Trigonometry: UIViewController {
// slide-in menuen
    var SlideInMenu = false
    @IBOutlet weak var SlideInMenuButton: UIButton!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var SlideInMenuConstraint: NSLayoutConstraint!
    
    @IBAction func Trigonometry(_ sender: UIButton) {if SlideInMenu == true{
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
        SlideInMenu = false
        }}
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
    
// trigonometry
    
    
    
    var TriangleType = false
    @IBAction func TrigoSwitch(_ sender: UISegmentedControl) {
        if TriangleType == false{TriangleType = true}
        else{TriangleType = false}
    
    
        if TriangleType == true{
            Perpandicular.alpha = 0
            ARef.alpha = 0
            BRef.alpha = 0
            CRef.alpha = 0
            AvRef.alpha = 0
            BvRef.alpha = 0
            EqualeritalTriangle.alpha = 1
            AT.alpha = 1
            BT.alpha = 1
            CT.alpha = 1
            ATV.alpha = 1
            BTV.alpha = 1
            CTV.alpha = 1
            ARef.text = nil
            BRef.text = nil
            CRef.text = nil
            AvRef.text = nil
            BvRef.text = nil

        }
        else{
            Perpandicular.alpha = 1
            ARef.alpha = 1
            BRef.alpha = 1
            CRef.alpha = 1
            AvRef.alpha = 1
            BvRef.alpha = 1
            EqualeritalTriangle.alpha = 0
            AT.alpha = 0
            BT.alpha = 0
            CT.alpha = 0
            ATV.alpha = 0
            BTV.alpha = 0
            CTV.alpha = 0
            AT.text = nil
            BT.text = nil
            CT.text = nil
            ATV.text = nil
            BTV.text = nil
            CTV.text = nil

        }
    
    }
    
    
    
    
// Equarital udregning
    
    @IBOutlet weak var EqualeritalTriangle: UIImageView!
    @IBOutlet weak var AT: UITextField!
    @IBOutlet weak var BT: UITextField!
    @IBOutlet weak var CT: UITextField!
    @IBOutlet weak var ATV: UITextField!
    @IBOutlet weak var BTV: UITextField!
    @IBOutlet weak var CTV: UITextField!
    
    
    
    
    
    
// perpandicular udregning
    
    @IBOutlet weak var Perpandicular: UIImageView!
    @IBOutlet weak var ARef: UITextField!
    @IBOutlet weak var BRef: UITextField!
    @IBOutlet weak var CRef: UITextField!
    @IBOutlet weak var AvRef: UITextField!
    @IBOutlet weak var BvRef: UITextField!
    
    
    
    var A: Double = 0
    var B: Double = 0
    var C: Double = 0
    var Av: Double = 0
    var Bv: Double = 0
    var Cv: Double = 0
    


    
    func StringToDouble(InputString: String) -> Double? {
            return NumberFormatter().number(from: InputString)?.doubleValue
}

    @IBAction func Calculate(_ sender: UIButton) {
        if TriangleType == false{
        A = (ARef.text! as NSString).doubleValue
        B = (BRef.text! as NSString).doubleValue
        C = (CRef.text! as NSString).doubleValue
        Av = (AvRef.text! as NSString).doubleValue
        Bv = (BvRef.text! as NSString).doubleValue
        
        if A > 0 && B > 0{
            C = sqrt((A*A) + (B*B))
            Av = asin(A / C) * 180 / Double.pi
            Bv = asin(B / C) * 180 / Double.pi
        }
        else if A > 0 && C > 0 {
            B = sqrt((C*C) - (A*A))
            Av = asin(A / C) * 180 / Double.pi
            Bv = asin(B / C) * 180 / Double.pi
        }
        else if C > 0 && B > 0 {
            A = sqrt((C*C) - (B*B))
            Av = asin(A / C) * 180 / Double.pi
            Bv = asin(B / C) * 180 / Double.pi
        }
        else if A > 0 && Av > 0{
            C = A / sin(Av/180*Double.pi)
            B = A / tan(Av/180*Double.pi)
            Bv = asin(B / C) * 180 / Double.pi
        }
        else if A > 0 && Bv > 0{
            C = A / cos(Bv/180*Double.pi)
            B = A * tan(Bv/180*Double.pi)
            Av = asin(A / C) * 180 / Double.pi
        }
        else if B > 0 && Bv > 0{
            C = B / sin(Bv/180*Double.pi)
            A = B / tan(Bv/180*Double.pi)
            Av = asin(A / C) * 180 / Double.pi
        }
        else if B > 0 && Av > 0{
            C = B / cos(Av/180*Double.pi)
            A = B * tan(Av/180*Double.pi)
            Bv = asin(B / C) * 180 / Double.pi
        }
        else if C > 0 && Av > 0{
            A = C * sin(Av/180*Double.pi)
            B = C * cos(Av/180*Double.pi)
            Bv = asin(B / C) * 180 / Double.pi
        }
        else if C > 0 && Bv > 0{
            B = C * sin(Bv/180*Double.pi)
            A = C * cos(Bv/180*Double.pi)
            Av = asin(A / C) * 180 / Double.pi
        }
        else if Av > 0 && Bv > 0{
            A = 1
            C = A / sin(Av/180*Double.pi)
            B = A / tan(Av/180*Double.pi)
        }
        
        
        if (A*2).truncatingRemainder(dividingBy: 2) == 0{ ARef.text = String(Int(A))}
        else {ARef.text = String(A)}
        if (B*2).truncatingRemainder(dividingBy: 2) == 0 { BRef.text = String(Int(B))}
        else {BRef.text = String(B)}
        if (C*2).truncatingRemainder(dividingBy: 2) == 0 { CRef.text = String(Int(C))}
        else {CRef.text = String(C)}
        AvRef.text = String(Av)+"º"
        BvRef.text = String(Bv)+"º"
        }
        
        else{
            A = (AT.text! as NSString).doubleValue
            B = (BT.text! as NSString).doubleValue
            C = (CT.text! as NSString).doubleValue
            Av = (ATV.text! as NSString).doubleValue
            Bv = (BTV.text! as NSString).doubleValue
            Cv = (CTV.text! as NSString).doubleValue
        
            if A > 0 && B > 0 && C > 0{
            Av = acos(((B*B) + (C*C) - (A*A))/(2*B*C))*180/Double.pi
            Bv = acos(((A*A) + (C*C) - (B*B))/(2*A*C))*180/Double.pi
            Cv = acos(((B*B) + (A*A) - (C*C))/(2*B*A))*180/Double.pi
            }
            else if A > 0 && B > 0 && Av > 0{
            Bv = asin(sin(Av*Double.pi/180)/A*B)*180/Double.pi
            Cv = 180-Av-Bv
            C = A/sin(Av*Double.pi/180)*sin(Cv*Double.pi/180)
            }
            else if A > 0 && B > 0 && Bv > 0{
            Av = asin(sin(Bv*Double.pi/180)/B*A)*180/Double.pi
            Cv = 180-Av-Bv
            C = B/sin(Bv*Double.pi/180)*sin(Cv*Double.pi/180)
            }
            else if A > 0 && B > 0 && Cv > 0{
            C = sqrt((B*B)+(A*A)-(2 * A * B * cos(Cv*Double.pi/180)))
            Av = asin(sin(Cv*Double.pi/180)/C*A)*180/Double.pi
            Bv = 180-Av-Cv
            }
            else if A > 0 && C > 0 && Av > 0{
            Cv = asin(sin(Av*Double.pi/180)/A*C)*180/Double.pi
            Bv = 180-Av-Cv
            B = A/sin(Av*Double.pi/180)*sin(Bv*Double.pi/180)
            }
            else if A > 0 && C > 0 && Bv > 0{
            B = sqrt((C*C)+(A*A)-(2 * A * C * cos(Bv*Double.pi/180)))
            Av = asin(sin(Bv*Double.pi/180)/B*A)*180/Double.pi
            Cv = 180-Av-Bv
            }
            else if A > 0 && C > 0 && Cv > 0{
            Av = asin(sin(Cv*Double.pi/180)/C*A)*180/Double.pi
            Bv = 180-Av-Cv
            B = C/sin(Cv*Double.pi/180)*sin(Bv*Double.pi/180)
            }
            else if B > 0 && C > 0 && Av > 0{
            A = sqrt((B*B)+(C*C)-(2 * C * B * cos(Av*Double.pi/180)))
            Cv = asin(sin(Av*Double.pi/180)/A*C)*180/Double.pi
            Bv = 180-Av-Cv
            }
            else if B > 0 && C > 0 && Bv > 0{
            Cv = asin(sin(Bv*Double.pi/180)/B*C)*180/Double.pi
            Av = 180-Bv-Cv
            A = B/sin(Bv*Double.pi/180)*sin(Av*Double.pi/180)
            }
            else if B > 0 && C > 0 && Cv > 0{
            Bv = asin(sin(Cv*Double.pi/180)/C*B)*180/Double.pi
            Av = 180-Bv-Cv
            A = C/sin(Cv*Double.pi/180)*sin(Av*Double.pi/180)
            }
            else if Av > 0 && Bv > 0 && A > 0{
            B = A/sin(Av*Double.pi/180)*sin(Bv*Double.pi/180)
            Cv = 180-Av-Bv
            C = A/sin(Av*Double.pi/180)*sin(Cv*Double.pi/180)
            }
            else if Av > 0 && Bv > 0 && B > 0{
            A = B/sin(Bv*Double.pi/180)*sin(Av*Double.pi/180)
            Cv = 180-Av-Bv
            C = B/sin(Bv*Double.pi/180)*sin(Cv*Double.pi/180)
            }
            else if Av > 0 && Bv > 0 && C > 0{
            Cv = 180-Av-Bv
            A = C/sin(Cv*Double.pi/180)*sin(Av*Double.pi/180)
            B = C/sin(Cv*Double.pi/180)*sin(Bv*Double.pi/180)
            }
            else if Av > 0 && Cv > 0 && A > 0{
            C = A/sin(Av*Double.pi/180)*sin(Cv*Double.pi/180)
            Bv = 180-Av-Cv
            B = A/sin(Av*Double.pi/180)*sin(Bv*Double.pi/180)
            }
            else if Av > 0 && Cv > 0 && B > 0{
            Bv = 180-Av-Cv
            A = B/sin(Bv*Double.pi/180)*sin(Av*Double.pi/180)
            C = B/sin(Bv*Double.pi/180)*sin(Cv*Double.pi/180)
            }
            else if Av > 0 && Cv > 0 && C > 0{
            A = C/sin(Cv*Double.pi/180)*sin(Av*Double.pi/180)
            Bv = 180-Av-Cv
            B = C/sin(Cv*Double.pi/180)*sin(Bv*Double.pi/180)
            }
            else if Bv > 0 && Cv > 0 && A > 0{
            Av = 180-Bv-Cv
            B = A/sin(Av*Double.pi/180)*sin(Bv*Double.pi/180)
            C = A/sin(Av*Double.pi/180)*sin(Cv*Double.pi/180)
            }
            else if Bv > 0 && Cv > 0 && B > 0{
            C = B/sin(Bv*Double.pi/180)*sin(Cv*Double.pi/180)
            Av = 180-Bv-Cv
            A = B/sin(Bv*Double.pi/180)*sin(Av*Double.pi/180)
            }
            else if Bv > 0 && Cv > 0 && C > 0{
            B = C/sin(Cv*Double.pi/180)*sin(Bv*Double.pi/180)
            Av = 180-Bv-Cv
            A = C/sin(Cv*Double.pi/180)*sin(Av*Double.pi/180)
            }
            else if Av > 0 && Bv > 0 && Cv > 0 {
            A = 1
            C = A/sin(Av*Double.pi/180)*sin(Cv*Double.pi/180)
            B = A/sin(Av*Double.pi/180)*sin(Bv*Double.pi/180)
            }

        
            if (A*2).truncatingRemainder(dividingBy: 2) == 0{ AT.text = String(Int(A))}
            else {AT.text = String(A)}
            if (B*2).truncatingRemainder(dividingBy: 2) == 0 {BT.text = String(Int(B))}
            else {BT.text = String(B)}
            if (C*2).truncatingRemainder(dividingBy: 2) == 0 {CT.text = String(Int(C))}
            else {CT.text = String(C)}
            
            ATV.text = String(Av)+"º"
            BTV.text = String(Bv)+"º"
            CTV.text = String(Cv)+"º"
         }
    }
    
    
    @IBAction func AC(_ sender: UIButton) {
        
        A = 0
        B = 0
        C = 0
        Av = 0
        Bv = 0
        Cv = 0
        ARef.text = nil
        BRef.text = nil
        CRef.text = nil
        AvRef.text = nil
        BvRef.text = nil
        AT.text = nil
        BT.text = nil
        CT.text = nil
        ATV.text = nil
        BTV.text = nil
        CTV.text = nil
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
