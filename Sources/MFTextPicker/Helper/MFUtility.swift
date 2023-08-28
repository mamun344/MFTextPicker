//
//  MFUtility.swift
//  MFTextPicker Example
//
//  Created by Mamun on 27/8/23.
//

import UIKit


class MFUtility {
    
    static var currentWindow: UIWindow? {
        UIApplication.shared.windows.first{ $0.isKeyWindow }
    }
    
    static func present(_ vc: UIViewController, animated: Bool = true, completion:(()->())? = nil) {
        if #available(iOS 13, *) {
            vc.modalPresentationStyle = .overFullScreen
        }
        else {
            vc.modalPresentationStyle = .overCurrentContext
        }
        
        if let topVC = topViewController(){
            topVC.present(vc, animated: animated, completion: {
                completion?()
            })
        }
    }
    
    static func topViewController()->UIViewController? {
        var topVC = currentWindow?.rootViewController
        
        if topVC?.presentedViewController != nil {
            topVC = currentWindow?.rootViewController?.presentedViewController
            
            while topVC?.presentedViewController != nil {
                topVC = topVC?.presentedViewController
            }
        }
        
        return topVC
    }
    
    static func dismiss(animated: Bool = true,  completion: (()->())? = nil) {
        if let topVC = topViewController() {
            topVC.dismiss(animated: animated) {
                completion?()
            }
        }
    }
}



extension UIView {
    class func identifier()-> String {
        let id = String(describing: self)
        return id
    }
    
    class func nib() -> UINib {
        return UINib.init(nibName: identifier() , bundle: nil)
    }
}
