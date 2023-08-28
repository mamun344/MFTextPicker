//
//  MFTextPicker.swift
//  MFTextPicker Example
//
//  Created by Mamun on 27/8/23.
//

import UIKit

public class MFTextPicker: NSObject {
    
    public static let shared = MFTextPicker()
    
    
    public var defaultColor: UIColor = .white {
        didSet {
            color = defaultColor
        }
    }
    
    public var defaultTintColor: UIColor = .black {
        didSet {
            tintColor = defaultTintColor
        }
    }
    
    public var defaultHighlightColor: UIColor? = nil {
        didSet {
            highlightColor = defaultHighlightColor
        }
    }
    
    public var defaultSeparatorColor: UIColor? = nil {
        didSet {
            separatorColor = defaultSeparatorColor
        }
    }
    
    
    private var color           : UIColor
    private var tintColor       : UIColor
    private var highlightColor  : UIColor?
    private var separatorColor  : UIColor?
    
    
    
    private override init() {
        color = defaultColor
        tintColor = defaultTintColor
        highlightColor = defaultHighlightColor
        separatorColor = defaultSeparatorColor
    }
    
    public func reset() {
        color = defaultColor
        tintColor = defaultTintColor
        highlightColor = defaultHighlightColor
        separatorColor = defaultSeparatorColor
    }
    
    public static func config(color: UIColor, tintColor: UIColor, highlightColor: UIColor? = nil, separatorColor: UIColor? = nil) {
        shared.color = color
        shared.tintColor = tintColor
        shared.highlightColor = highlightColor
        shared.separatorColor = separatorColor
    }
    
    public static func show(_ texts: [String], title: String, index: Int = -1, onSelect:@escaping ((Int?, String?)->())){
        let popupView = MFTextPickerView.initWith(title: title, items: texts, selectedIndex: index, bgColor: shared.color, textColor: shared.tintColor, textHightlightColor: shared.highlightColor, separatorColor: shared.separatorColor) { index, text in
            
            MFUtility.dismiss() {
                onSelect(index, text)
            }
        }
        
        let popupVC = MFPopupViewController.init(contentView: popupView, popupWidth: popupView.frame.width)
        popupVC.canTapOutsideToDismiss = false
        popupVC.cornerRadius = 15
        MFUtility.present(popupVC)
    }
}
