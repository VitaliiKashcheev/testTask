//
//  CellController.swift
//  testTask
//
//  Created by Виталий on 12/17/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    //Properties
    
    let cellView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 8
        return cv
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    let productImage: UIImageView = {
        let image = UIImage(named: "")
        let imageWiew = UIImageView(image: image)
        imageWiew.layer.cornerRadius = 30
        return imageWiew
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        
        addSubview(cellView)
        cellView.pinEdgesToSuperView()
        cellView.addSubview(codeLabel)
        codeLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10).isActive = true
        codeLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        codeLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        codeLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        codeLabel.translatesAutoresizingMaskIntoConstraints = false

        cellView.addSubview(productImage)
        productImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        productImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -30).isActive = true
        productImage.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        productImage.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        productImage.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        productImage.translatesAutoresizingMaskIntoConstraints = false
        
    }

}

extension UIView {
    
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
}
