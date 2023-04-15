import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ChatViewController: UIViewController{
    
    let chatTableView = UITableView()
    private let dataSource : ChatTableViewDataSource?
    private let delegate : ChatTableViewDelegate?
    private let messageTF = UITextField()
    private let sendPressed = UIButton()
    var message: [Message] = [
    Message(sender: "1@2.com", body: "Hola"),
    Message(sender: "a@b.com", body: "Hola, como estas?"),
    Message(sender: "1@2.com", body: "bien y tu?")
    ]
    
    init(dataSourceTable: ChatTableViewDataSource, delegateTable: ChatTableViewDelegate){
        self.dataSource = dataSourceTable
        self.delegate = delegateTable
        super.init(nibName: nil, bundle: nil)
        self.dataSource?.viewController = self
        self.delegate?.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar Sesión", style: .plain, target: self, action: #selector(LogOut))
        navigationItem.hidesBackButton = true
        title = "🫂TeamChat"
        initViews()
    }
    
    @objc func LogOut(){
       do {
         try Auth.auth().signOut()
           self.navigationController?.popToRootViewController(animated: true)
       } catch let signOutError as NSError {
         print("Error signing out: %@", signOutError)
       }
    }
    
    private func initViews(){
        chatTableViewSetup()
        messageTFSetup()
        sendPressedSetup()
        setConstraints()
    }
    
    private func chatTableViewSetup(){
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.backgroundColor = .white
        chatTableView.dataSource = dataSource
        chatTableView.delegate = delegate
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(chatTableView)
    }
    
    private func messageTFSetup(){
        messageTF.translatesAutoresizingMaskIntoConstraints = false
        messageTF.layer.cornerRadius = 15
        messageTF.backgroundColor = .yellow
        messageTF.placeholder = "Escribe aquí"
        messageTF.font = .systemFont(ofSize: 15)
        messageTF.leftViewMode = .always
        messageTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 10))
        view.addSubview(messageTF)
    }
    
    private func sendPressedSetup(){
        sendPressed.backgroundColor = .blue
        sendPressed.setTitle("ok", for: .normal)
        sendPressed.addTarget(self, action: #selector(sendPressedAction), for: .touchUpInside)
        sendPressed.layer.cornerRadius = 15
        sendPressed.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendPressed)
    }
    
    @objc func sendPressedAction(){
        let alert = UIAlertController(title: "Enviado", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            messageTF.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            messageTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            messageTF.heightAnchor.constraint(equalToConstant: 50),
            messageTF.trailingAnchor.constraint(equalTo: sendPressed.leadingAnchor, constant: -12),
            sendPressed.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            sendPressed.heightAnchor.constraint(equalToConstant: 50),
            sendPressed.widthAnchor.constraint(equalToConstant: 20),
            sendPressed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -30),
            chatTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: messageTF.topAnchor)
        ])
    }
}
