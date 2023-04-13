
import UIKit

class ChatTableViewDataSource : NSObject{
    weak var viewController: ChatViewController?
}

extension ChatTableViewDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = viewController?.chatTableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) else {return UITableViewCell()}
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = "Hola"
        cell.contentConfiguration = listContentConfiguration
        return cell
    }
}
