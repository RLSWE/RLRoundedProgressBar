//
//  ViewController.swift
//  RoundedProgressBar
//
//  Created by Roni Leshes on 04/07/2017.
//  Copyright © 2017 Roni Leshes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var progressView: RLRoundedProgressView!
    @IBOutlet weak var progressTextField: UITextField!
    @IBOutlet weak var animatedSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func setProgressPressed(_ sender: Any) {
        let percent = CGFloat(Double(self.progressTextField.text ?? "")!)
        
        if self.animatedSwitch.isOn{
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseInOut, animations: {
                self.progressView.setProgress(percent:percent)
            }, completion: nil)
            
        }else{
            
            self.progressView.setProgress(percent:percent)
            
        }
    }

    
    
    //====================================
    //MARK: Textfield delegate
    //====================================
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullString = "\(self.progressTextField.text ?? "")\(string)"
        let doubleValue = Double(fullString)
        if  doubleValue! > 100.0 || doubleValue! < 0.0{ //Make sure text field will have a valid percent value
            return false
        }
        return true
    }
}

