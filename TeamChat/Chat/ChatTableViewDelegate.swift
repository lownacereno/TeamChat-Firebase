import UIKit

class ChatTableViewDelegate : NSObject{
    var viewController: ChatViewController?
}

extension ChatTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
