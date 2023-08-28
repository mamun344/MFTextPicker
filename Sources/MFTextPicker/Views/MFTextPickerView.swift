//
//  MFTextPickerView.swift
//  EPS
//
//  Created by Mamun on 28/8/23.
//

import UIKit

class MFTextPickerView: UIView {
    
    @IBOutlet weak var titleLabel           : UILabel!
    @IBOutlet weak var closeButton          : UIButton!
    @IBOutlet weak var dividerView          : UIView!
    @IBOutlet weak var optionTableView      : UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!

    
    private var items           : [String] = []
    private var selectedIndex   : Int = -1
    private var title           : String?
    private var completion      :((Int?, String?)->())!

    private var rowHeight       : CGFloat = 0.0
    private var tableHeight     : CGFloat = 0.0

    private var bgColor             : UIColor = .black
    private var textColor           : UIColor = .black
    private var textHightlightColor : UIColor? = nil
    private var separatorColor      : UIColor? = nil

    
    
    class func initWith(title: String?,
                        items: [String],
                        selectedIndex: Int = -1,
                        rowHeight: CGFloat = 40.0,
                        bgColor: UIColor,
                        textColor: UIColor,
                        textHightlightColor: UIColor?,
                        separatorColor: UIColor?,
                        completion: @escaping ((Int?, String?)->()))->MFTextPickerView {
        
        guard let vw = Self.nib().instantiate(withOwner: nil, options: nil).first as? MFTextPickerView  else {
            fatalError("Error loading \(self) from nib")
        }
        
        vw.rowHeight = rowHeight
        let height = CGFloat(items.count) * vw.rowHeight
        var maxHeight = UIScreen.main.bounds.height - 40.0 - 62.0
        
        if let safeArea = MFUtility.currentWindow?.safeAreaInsets {
            maxHeight = maxHeight - safeArea.top - safeArea.bottom
        }
        
        vw.bgColor = bgColor
        vw.textColor = textColor
        vw.textHightlightColor = textHightlightColor
        vw.separatorColor = separatorColor
        
        vw.tableHeight = min(height, maxHeight)
        vw.frame = CGRect.init(x: 0, y: 0, width: min(320.0, UIScreen.main.bounds.width - 30.0), height: 200)
        vw.title = title
        vw.items = Array(items)
        vw.selectedIndex = selectedIndex
        vw.completion = completion
        vw.backgroundColor = bgColor
        return vw
    }

    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        titleLabel.text = title ?? ""
        tableHeightConstraint.constant = tableHeight
        titleLabel.textColor = textColor
        dividerView.backgroundColor = textColor.withAlphaComponent(0.2)
        closeButton.imageView?.tintColor = textColor.withAlphaComponent(0.4)
        
        if let separatorColor {
            optionTableView.separatorColor = separatorColor
            optionTableView.separatorStyle = .singleLine
        }
        else {
            optionTableView.separatorColor = nil
            optionTableView.separatorStyle = .none
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        closeButton.imageView?.contentMode = .scaleAspectFit
        
        optionTableView.register(MFTextPickerTableCell.nib(), forCellReuseIdentifier: MFTextPickerTableCell.identifier())
        optionTableView.reloadData()
    }
    
    
    @IBAction func closeAction(){
        completion?(nil, nil)
    }
}


extension MFTextPickerView : UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MFTextPickerTableCell.identifier(), for: indexPath) as! MFTextPickerTableCell
        cell.reload(text: items[indexPath.row], selected: indexPath.row == selectedIndex, color: textColor, highlightColor: textHightlightColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        completion?(indexPath.row, self.items[indexPath.row])
    }
}



