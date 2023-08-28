//
//  MFTextPickerTableCell.swift
//  EPS
//
//  Created by Mamun on 28/8/23.
//

import UIKit


class MFTextPickerTableCell: UITableViewCell {

    @IBOutlet weak var optionTextLabel  : UILabel!
    @IBOutlet weak var selectImageView  : UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectImageView.isHidden = true
//        contentView.backgroundColor = .yellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func reload(text: String, selected: Bool, color: UIColor, highlightColor: UIColor?){
        optionTextLabel.text = text
        optionTextLabel.textColor = (selected && highlightColor != nil) ? highlightColor! : color
    }
    
}
