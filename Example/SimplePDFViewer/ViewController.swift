//
//  ViewController.swift
//  SimplePDFViewer
//
//  Created by frankfka on 05/22/2019.
//  Copyright (c) 2019 frankfka. All rights reserved.
//

import UIKit
import SnapKit
import SimplePDFViewer

class ViewController: UIViewController {
    
    private static let TEST_PDF_URL = "https://education.github.com/git-cheat-sheet-education.pdf"
    private static let TEST_INVALID_PDF_URL = "https://education.github.com/git-cheat-sheet-education.pf"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let superview = self.view!
        
        // Standard
        let standardPDFButton = UIButton()
        standardPDFButton.backgroundColor = .black
        standardPDFButton.setTitle("Standard PDF VC", for: .normal)
        standardPDFButton.addTarget(self, action: #selector(launchStandardPDFVC), for: .touchUpInside)
        superview.addSubview(standardPDFButton)
        standardPDFButton.snp.makeConstraints() { make in
            make.right.equalTo(superview.snp.right).offset(-20)
            make.left.equalTo(superview.snp.left).offset(20)
            make.top.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(60)
        }
        
        // Customized
        let customizedPDFButton = UIButton()
        customizedPDFButton.backgroundColor = .blue
        customizedPDFButton.setTitle("Custom PDF VC", for: .normal)
        customizedPDFButton.addTarget(self, action: #selector(launchCustomizedPDFVC), for: .touchUpInside)
        superview.addSubview(customizedPDFButton)
        customizedPDFButton.snp.makeConstraints() { make in
            make.right.equalTo(superview.snp.right).offset(-20)
            make.left.equalTo(superview.snp.left).offset(20)
            make.top.equalTo(standardPDFButton.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        // Invalid
        let invalidPDFButton = UIButton()
        invalidPDFButton.backgroundColor = .purple
        invalidPDFButton.setTitle("Invalid PDF VC", for: .normal)
        invalidPDFButton.addTarget(self, action: #selector(launchInvalidPDFVC), for: .touchUpInside)
        superview.addSubview(invalidPDFButton)
        invalidPDFButton.snp.makeConstraints() { make in
            make.right.equalTo(superview.snp.right).offset(-20)
            make.left.equalTo(superview.snp.left).offset(20)
            make.top.equalTo(customizedPDFButton.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
    }
    
    @objc private func launchStandardPDFVC() {
        let pdfVC = SimplePDFViewController(urlString: ViewController.TEST_PDF_URL)
        present(pdfVC, animated: true, completion: nil)
        // You can also use it within a navigation stack by calling
        // navigationController?.pushViewController(pdfVC, animated: true)
    }
    
    @objc private func launchCustomizedPDFVC() {
        let pdfVC = SimplePDFViewController(urlString: ViewController.TEST_PDF_URL)
        pdfVC.viewTitle = "Test View Title" // Custom view title on top bar
        pdfVC.tint = .red // Tint applies to all views in the VC
        pdfVC.exportPDFName = "TestExportPDF" // File name for sharing, default is "Document"
        pdfVC.errorMessage = "Uh oh!" // Custom error message if PDF fails to load
        pdfVC.dismissalDelegate = self // Customize what happens when close button is pressed
        present(pdfVC, animated: true, completion: nil)
    }
    
    @objc private func launchInvalidPDFVC() {
        let pdfVC = SimplePDFViewController(urlString: ViewController.TEST_INVALID_PDF_URL)
        pdfVC.errorMessage = "Uh oh!"
        present(pdfVC, animated: true, completion: nil)
    }
    
}

// Extension for Dismissal Delegate
extension ViewController: SimplePDFViewOnDismissDelegate {
    
    func didDismiss(_ sender: SimplePDFViewController) {
        // It is your responsibility to dismiss the VC
        sender.dismiss(animated: true, completion: nil)
        // Do whatever else you want to do
        print("Hello!")
    }

}
