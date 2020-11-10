//
//  ForgotPassController.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class ForgotPassController: UIViewController {

    @IBOutlet weak var emailTf: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmailTf()
        tapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        
        
    }
    
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    private func setupEmailTf() {
        emailTf.layer.borderWidth = 1
        emailTf.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        emailTf.layer.cornerRadius = 10
    
    }
    
    private func setupNavigation() {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Code", bundle: nil).instantiateViewController(identifier: "CodeController") as! CodeController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
 
    
    @IBAction func toSignIn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
   
    }
    
    
}
