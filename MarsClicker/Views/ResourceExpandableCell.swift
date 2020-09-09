//
//  ResourceExpandableCell.swift
//  MarsClicker
//
//  Created by Aidan Blant on 9/4/20.
//  Copyright © 2020 Aidan Blant. All rights reserved.
//

import UIKit

class ResourceExpandableCell: UITableViewCell {

    @IBOutlet var ResourceName : UILabel!
    @IBOutlet var CurrentAmount : UILabel!
    @IBOutlet var RateOfChange : UILabel!
    var isExpanded : Bool = false;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
