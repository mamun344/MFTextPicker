//
//  ViewController.swift
//  MFTextPicker Example
//
//  Created by Mamun on 27/8/23.
//

import UIKit
import MFTextPicker


class ViewController: UIViewController {

    @IBOutlet private var designationButton: UIButton!
    @IBOutlet private var genderButton: UIButton!

    private let designations: [String] = ["Engineer", "Doctor", "Lawyer", "Accountant", "HR"]
    private let genders: [String] = ["Male", "Female", "Others", "Unknown"]

    private var selectedDesignation: Int = -1 {
        didSet {
            designationButton.setTitle(selectedDesignation == -1 ? "Select designation" : designations[selectedDesignation], for: .normal)
            designationButton.setTitleColor(selectedDesignation == -1 ? .gray : .black, for: .normal)
        }
    }
    
    private var selectedGender: Int = -1 {
        didSet {
            genderButton.setTitle(selectedGender == -1 ? "Select gender" : genders[selectedGender], for: .normal)
            genderButton.setTitleColor(selectedGender == -1 ? .gray : .black, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
        
        selectedDesignation = -1
        selectedGender = -1
    }
    
    private func setupUI() {
        for btn in [designationButton, genderButton] {
            btn?.layer.cornerRadius = 5.0
            btn?.layer.borderWidth = 1.0
            btn?.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            btn?.clipsToBounds = true
        }
    }

    @IBAction func designationAction(){
        MFTextPicker.config(color: .white, tintColor: .red, highlightColor: .blue)
        
        MFTextPicker.show(designations, title: "Select Designation", index: selectedDesignation) { index, text in
            if let index {
                self.selectedDesignation = index
            }
            
            MFTextPicker.shared.reset()
        }
    }
    
    @IBAction func genderAction(){
        
        MFTextPicker.show(genders, title: "Select Gender", index: selectedGender) { index, text in
            if let index {
                self.selectedGender = index
            }
        }
    }

}

