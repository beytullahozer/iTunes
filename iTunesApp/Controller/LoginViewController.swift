//
//  LoginViewController.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 20.03.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    private let loginLabel = UILabel()
    private let signInLabel = UIButton()
    private let signUpButton = UIButton()
    private let signInButton = UIButton()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    var isPasswordHidden = true
    var isLoginActivated = false
    
    let emailSeperator = UIView()
    let passwordSeperator = UIView()
    
    private var textFieldStackView = UIStackView()
    private let buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        setView()
        setContraints()
        setDelegate()
        registerKeyboardNotification()
        
    }
    
    deinit{
        removeKeyboardNotification()
    }
    
    private func setView(){
        
        title = "Sign In"
        view.backgroundColor = .white
        
        loginLabel.text = "Log In"
        loginLabel.frame = CGRect(x: 0.1, y: 0.2 * screenHeight, width: 0.2 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(loginLabel)
        
        signUpButton.setTitle("Sign Up", for: UIControl.State.normal)
        signUpButton.frame = CGRect(x: 0.1, y: 0.4 * screenHeight, width: 0.2 * screenWidth, height: 0.05 * screenHeight)
        signUpButton.tintColor = .white
        signUpButton.layer.cornerRadius = 9
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: UIControl.Event.touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        signInButton.setTitle("Sign Up", for: UIControl.State.normal)
        signInButton.frame = CGRect(x: 0.1, y: 0.6 * screenHeight, width: 0.2 * screenWidth, height: 0.05 * screenHeight)
        signInButton.tintColor = .white
        signInButton.layer.cornerRadius = 9
        signInButton.addTarget(self, action: #selector(signInButtonClicked), for: UIControl.Event.touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        let emailLabel = UILabel()
        emailLabel.textColor = .black
        emailLabel.text = "Email"
        emailLabel.numberOfLines = 2
        emailLabel.textAlignment = .left
        emailLabel.font = font_SFProSemiBold(size: 18)
        emailLabel.frame = CGRect(x: 0 * screenWidth, y: 0.2 * screenHeight, width: 0.8 * screenWidth, height: 0.035 * screenHeight)
        view.addSubview(emailLabel)
        
        emailTextField.placeholder = "Email.."
        emailTextField.frame = CGRect(x: 0.1, y: 0.7 * screenHeight, width: 0.2 * screenWidth, height: 0.05 * screenHeight)
        emailTextField.textColor = .black
        emailTextField.font = UIFont(name: "Graphie-Bold", size: 20)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(emailTextField)
        
        
        emailSeperator.backgroundColor = clr_seperator
        emailSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        view.addSubview(emailSeperator)
        
        let passwordLabel = UILabel()
        passwordLabel.textColor = .black
        passwordLabel.text = "Password"
        passwordLabel.numberOfLines = 2
        passwordLabel.textAlignment = .left
        passwordLabel.font = font_SFProSemiBold(size: 18)
        passwordLabel.frame = CGRect(x: 0 * screenWidth, y: 0 * screenHeight, width: 0.8 * screenWidth, height: 0.035 * screenHeight)
        view.addSubview(passwordLabel)

        passwordTextField.placeholder = "Password.."
        passwordTextField.frame = CGRect(x: 0.1, y: 0.8 * screenHeight, width: 0.2 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(passwordTextField)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = clr_placeholder
        passwordTextField.font = font_SFProRegular(size: 14)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(passwordTextField)
        
        
        passwordSeperator.backgroundColor = clr_seperator
        passwordSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        view.addSubview(passwordSeperator)
        
        textFieldStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        textFieldStackView.frame = CGRect(x: 0.1, y: 0.6 * screenHeight, width: 0.2 * screenWidth, height: 0.05 * screenHeight)
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 10
        textFieldStackView.distribution = .fillProportionally
        
    }
    
    private func setContraints(){
        
    }
    
    private func setDelegate(){
        
    }
    
    private func registerKeyboard(){
        
    }
    
    private func registerKeyboardNotification(){
        
    }
    
    private func removeKeyboardNotification(){
        
    }
    
    @objc func signUpButtonClicked(){
        print("signup")
        
        let signUpVC = SingUpViewController()
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    @objc func signInButtonClicked(){
        print("signin")
        
        let mail = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let user = findUserDatabase(mail: mail)
    
        
        if user == nil {
            loginLabel.text = "User Not Founded."
            loginLabel.textColor = .red
        }
//        } else if user?.password == password {
//            let nav
//        }
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        emailTextField.text = emailTextField.text?.lowercased()
        
        if passwordTextField.text == "" || !isPasswordHidden{
            
            passwordTextField.font = font_SFProRegular(size: 14)
            
        }else{
            
            passwordTextField.font = font_SFProRegular(size: 20)
            
        }
        
        if passwordTextField.text!.count < 6 || !isValidEmail(emailTextField.text!){
            
//            isLoginActivated = false
//            loginBtn.deactivated()
            
        }else{
            
//            isLoginActivated = true
//            loginBtn.activated()
           
            
        }
    }
    
    private func findUserDatabase(mail: String) -> User? {
        
        let database = Database.shared.users
        print(database)
        
        
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    

    
    
    
}
