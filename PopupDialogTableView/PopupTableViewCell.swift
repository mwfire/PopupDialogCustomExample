//
//  PopupTableViewCell.swift
//  PopupDialogTableView
//
//  Created by Martin Wildfeuer on 31.12.16.
//  Copyright © 2016 mwfire development. All rights reserved.
//

import UIKit

class PopupTableViewCell: UITableViewCell {

    /// The reuse identifier for this cell
    static let cellIdentifier = "PopupTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

}
