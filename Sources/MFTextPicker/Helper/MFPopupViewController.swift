//
//  MFPopupViewController.swift
//  MFTextPicker Example
//
//  Created by Mamun on 27/8/23.
//
// inspired from EzPopup

import UIKit


 class MFPopupViewController: UIViewController {
    
    private(set) var popupWidth: CGFloat = 0
    
       
    var backgroundAlpha: CGFloat = 0.5
    var backgroundColor = UIColor.black
    var canTapOutsideToDismiss = true
    var cornerRadius: CGFloat = 0
    var shadowEnabled = true
        
    private(set) var contentView: UIView!
    private var containerView = UIView()
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    init(contentView: UIView, popupWidth: CGFloat) {
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
        self.popupWidth = popupWidth
        commonInit()
    }
    
    private func commonInit() {
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViews()
        addDismissGesture()
    }
    

    private func addDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissTapGesture(gesture:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView?.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = backgroundColor.withAlphaComponent(backgroundAlpha)
        
        if cornerRadius > 0 {
            contentView?.layer.cornerRadius = cornerRadius
            contentView?.layer.masksToBounds = true
        }
        
        if shadowEnabled {
            containerView.layer.shadowOpacity = 0.5
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowOffset = CGSize(width: 5, height: 5)
            containerView.layer.shadowRadius = 5
        }
    }
    
    private func setupViews() {
        addViews()
        
        let widthConstraint = NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: popupWidth)
        NSLayoutConstraint.activate([widthConstraint])
        
        let centerXConstraint = NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])
    }
    
    private func addViews() {
        view.addSubview(containerView)
        
        if let contentView = contentView {
            containerView.addSubview(contentView)
            
            let topConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let leftConstraint = NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            let rightConstraint = NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate([topConstraint, leftConstraint, bottomConstraint, rightConstraint])
        }
    }
    
    
    @objc func dismissTapGesture(gesture: UIGestureRecognizer) {
       
    }
}

extension MFPopupViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let touchView = touch.view, canTapOutsideToDismiss else {
            return false
        }
        
        return !touchView.isDescendant(of: containerView)
    }
}
