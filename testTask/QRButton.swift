//
//  QRButton.swift
//  testTask
//
//  Created by Виталий on 12/17/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import  UIKit

class QRButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addButton()
    }
    
    func addButton() {
        backgroundColor = UIColor(red: 0.07, green: 0.72, blue: 0.87, alpha: 1.00)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonConstraints()
    }
    
    func buttonConstraints(){
        guard let superView = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.centerXAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width:0, height:5)
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor(red: 0.07, green: 0.72, blue: 0.87, alpha: 1.00).cgColor
        self.layer.shadowOpacity = 0.3
    }
    
}
