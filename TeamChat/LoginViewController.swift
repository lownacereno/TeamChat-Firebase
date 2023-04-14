import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController{
    
    private let emailTF = UITextField()
    private let passwordTF = UITextField()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        initView()
    }
    
    private func initView(){
        textFieldSetup(textField: emailTF, placeholder: "email", type: "email")
        textFieldSetup(textField: passwordTF, placeholder: "password", type: "password")
        registerButtonSetup()
        constraintsSetup()
    }
    
    private func constraintsSetup(){
        
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            emailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 12),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    private func textFieldSetup(textField: UITextField, placeholder: String, type: String){
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 15
        textField.backgroundColor = .white
        textField.placeholder = placeholder
        textField.font = .systemFont(ofSize: 20)
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 10))
        
        switch type{
        case "email":
            textField.keyboardType = .emailAddress
            textField.textContentType = .emailAddress
        case "password":
            textField.isSecureTextEntry = true
        default:
            break
        }
        view.addSubview(textField)
    }
    
    private func registerButtonSetup(){
        
        loginButton.backgroundColor = .blue
        loginButton.setTitle("Iniciar sesión", for: .normal)
        loginButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        loginButton.layer.cornerRadius = 15
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
    }
    
    @objc func registerButtonAction(){
        let chatVC = ChatViewController(dataSourceTable: ChatTableViewDataSource(), delegateTable: ChatTableViewDelegate())        
        guard let email = emailTF.text, let password = passwordTF.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .destructive)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }else{
                self.navigationController?.pushViewController(chatVC, animated: true)
            }
        }
    }
}

