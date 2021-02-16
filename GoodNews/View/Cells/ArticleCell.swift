import Foundation
import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
        
}

// MARK: - Extension
extension ArticleCell {
    
    func setData(_ cell: ArticleModel) {
        titleLabel.text = cell.title
        descriptionlabel.text = cell.description
    }
}
