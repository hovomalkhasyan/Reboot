//
//  SavePasswordController.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class SavePasswordController: UIViewController {

    @IBOutlet weak var passwordTF: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextTF()
        tapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
        
    }
    
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    
    private func setupTextTF() {
        passwordTF.layer.cornerRadius = 10
        passwordTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        passwordTF.layer.borderWidth = 1
        
    }

    @IBAction func savePassword(_ sender: UIButton) {
        
    }
    
    @IBAction func yoSignIn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
