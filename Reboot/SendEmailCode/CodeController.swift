//
//  CodeController.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class CodeController: UIViewController {

    @IBOutlet weak var codeTF: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextTF()
        tapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    private func setupTextTF() {
        codeTF.layer.cornerRadius = 10
        codeTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        codeTF.layer.borderWidth = 1
        
    }


    @IBAction func confirmeAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "SavePassword", bundle: nil).instantiateViewController(identifier: "SavePasswordController") as! SavePasswordController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func toSignIn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
