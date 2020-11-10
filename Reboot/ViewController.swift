//
//  ViewController.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var iconClick = true
    
    @IBOutlet weak var passwordShowBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordT: TextField!
    @IBOutlet weak var emailTf: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        tapGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
        setupNavigationController()
    }

    private func setupNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTextFields() {
        passwordT.layer.borderWidth = 1
        passwordT.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        passwordT.layer.cornerRadius = 10
        
        emailTf.layer.borderWidth = 1
        emailTf.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        emailTf.layer.cornerRadius = 10
        
        emailTf.delegate = self
        passwordT.delegate = self
        
    }
    
    private func tapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    // MARK: - KeyboardSettings
    
    private func registerNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        
        guard let keyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame, from: nil).size.height
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
        
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    @IBAction func showPasswordAction(_ sender: UIButton) {
        if iconClick  {
            passwordT.isSecureTextEntry = false
            passwordShowBtn.setImage(UIImage(named: "глаз отк"), for: .normal)
            
        } else {
            passwordT.isSecureTextEntry = true
            passwordShowBtn.setImage(UIImage(named: "глаз зачерк."), for: .normal)
        }
        
        iconClick = !iconClick
        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(identifier: "tab") 
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func registerAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: "RegisterController") as! RegisterController
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = UIStoryboard(name: "ForgotPassword", bundle: nil).instantiateViewController(identifier: "ForgotPassController") as! ForgotPassController
            navigationController?.pushViewController(vc, animated: true)
        default:
        break
        }
    }
    
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        
        case emailTf:
            passwordT.becomeFirstResponder()
            
        case passwordT:
            UIView.animate(withDuration: 1) {
                self.view.endEditing(true)
            }
            
        default:
            break
        }
        
        return true
    }
    
}

