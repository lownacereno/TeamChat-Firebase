import UIKit

class WelcomeViewController: UIViewController{
    
    private let titleLabel = UILabel()
    private let registerButton = UIButton()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        initView()
    }
    
    private func initView(){
        titleLabelSetup()
        registerButtonSetup()
        loginButtonSetup()
        constraintsSetup()
    }
    
    private func constraintsSetup(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -80),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -12),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func titleLabelSetup(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 50)
        titleLabel.textColor = .init(red: 255/255.0, green: 158/255.0, blue: 158/255.0, alpha: 1)
        titleLabel.text = ""
        let titleText = "🫂TeamChat"
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
                
            }
            charIndex += 1
        }
        view.addSubview(titleLabel)
    }
    
    private func registerButtonSetup(){
        
        registerButton.backgroundColor = .init(red: 192/255.0, green: 238/255.0, blue: 228/255.0, alpha: 1)
        registerButton.setTitle("Registrarse", for: .normal)
        registerButton.setTitleColor(.init(red: 255/255.0, green: 158/255.0, blue: 158/255.0, alpha: 1), for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        registerButton.layer.cornerRadius = 15
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
    }
    
    @objc func registerButtonAction(){
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    private func loginButtonSetup(){
        
        loginButton.backgroundColor = .init(red: 248/255.0, green: 249/255.0, blue: 136/255.0, alpha: 1)
        loginButton.setTitle("Iniciar sesión", for: .normal)
        loginButton.setTitleColor(.init(red: 255/255.0, green: 158/255.0, blue: 158/255.0, alpha: 1), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        loginButton.layer.cornerRadius = 15
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
    }
    
    @objc func loginButtonAction(){
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
