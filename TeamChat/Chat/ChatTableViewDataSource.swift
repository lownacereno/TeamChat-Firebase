
import UIKit

class ChatTableViewDataSource : NSObject{
    weak var viewController: ChatViewController?
    
}

extension ChatTableViewDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vc = viewController?.message.count else {return 0}
        return vc
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = viewController?.chatTableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) else {return UITableViewCell()}
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = viewController?.message[indexPath.row].body
        cell.contentConfiguration = listContentConfiguration
        return cell
    }
}
