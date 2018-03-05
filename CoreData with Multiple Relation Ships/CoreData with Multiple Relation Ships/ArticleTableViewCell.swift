//
//  ArticleTableViewCell.swift
//  CoreData with Multiple Relation Ships
//
//  Created by Mohd Imran on 2/23/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage:UIImageView!
    @IBOutlet weak var articleTitle:UILabel!
    @IBOutlet weak var articlePublisher:UILabel!
    @IBOutlet weak var articlePublishedDate:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
