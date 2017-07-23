//
//  Functions.swift
//  MathPal
//
//  Created by Nicolaj Thomsen on 14/07/2017.
//  Copyright © 2017 Nicolaj Thomsen. All rights reserved.
//

import UIKit

class Functions: UIViewController {
    // slide-in menuen
    var SlideInMenu = false
    @IBOutlet weak var SlideInMenuButton: UIButton!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var SlideInMenuConstraint: NSLayoutConstraint!
    
    @IBAction func Functions(_ sender: UIButton) {if SlideInMenu == true{
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


    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var C: UITextField!








    @IBAction func Calculate(_ sender: UIButton) {
    }

    


    @IBAction func AC(_ sender: Any) {
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
