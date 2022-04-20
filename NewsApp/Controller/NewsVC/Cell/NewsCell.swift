//
//  NewsCell.swift
//  NewsApp
//
//  Created by Utku on 19.04.2022.
//

import UIKit
import Kingfisher
class NewsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(news: NewsElement?) {
        titleLabel.text = news?.title
        summaryLabel.text = news?.summary
        newsImageView.kf.setImage(with: URL(string: news?.imageURL ?? ""))
    }
}
