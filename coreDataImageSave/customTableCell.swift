//
//  customTableCell.swift
//  coreDataImageSave
//
//  Created by Manuel Soberanis on 10/06/20.
//  Copyright © 2020 featherSoft. All rights reserved.
//

import UIKit

class customTableCell: UITableViewCell {

    @IBOutlet weak var customcellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
