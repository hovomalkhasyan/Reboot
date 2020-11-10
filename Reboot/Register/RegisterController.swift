//
//  RegisterController.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var work: UITextField!
    @IBOutlet weak var birthDay: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var fullName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        tfDelegates()
        tapGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
        
    }
    
    private func setupNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupStackView() {
        for v in stackView.subviews {
            v.layer.cornerRadius = 10
            v.layer.borderWidth = 1
            v.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            
        }
        
    }
    
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func tfDelegates() {
     
        password.delegate = self
        work.delegate = self
        birthDay.delegate = self
        email.delegate = self
        phoneNumber.delegate = self
        fullName.delegate = self
        
    }
    
    @IBAction func toSignIn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension RegisterController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        
        case fullName:
            phoneNumber.becomeFirstResponder()
            
        case phoneNumber:
            email.becomeFirstResponder()
        
        case email:
            birthDay.becomeFirstResponder()
            
        case birthDay:
            work.becomeFirstResponder()
            
        case work:
            password.becomeFirstResponder()
            
        case password:
            UIView.animate(withDuration: 1) {
                self.view.endEditing(true)
            }
        
        default:
            break
        }
        
        return true
    }
    
    
}


