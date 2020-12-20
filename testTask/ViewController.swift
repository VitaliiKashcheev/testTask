//
//  ViewController.swift
//  testTask
//
//  Created by Виталий on 12/17/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

struct QrData {
    
    var qrDataString: String
}


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id"
    
    var storageString: String? = nil
    
    var selectedStatHeaders = Set<Int>()
    
    var array:Array<Item> = []
        
    var remoteStorage = RemoteStorage()
    
    var centerButton: QRButton = {
        let cb = QRButton()
        return cb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Main"
        
        collectionView?.backgroundColor = UIColor.lightGray
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(centerButton)
        centerButton.setTitle("QR Code", for: .normal)
        centerButton.addTarget(self, action: #selector(qrButtonAction(sender:)), for: .touchUpInside)
        
        array = remoteStorage.getItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        if storageString != nil{
            
            allertController()
        }

    }
    
    @objc func qrButtonAction(sender:UIButton) {
        
        let controller = QRScreenController()
        navigationController?.pushViewController(controller, animated: true)
        controller.startRunning()
        controller.delegate = self
        print("On Click")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
        
        cell.productImage.image = UIImage(named: array[indexPath.row].pictureName)
        cell.codeLabel.text = array[indexPath.row].code
        
        if selectedStatHeaders.contains(indexPath.row) {
            if storageString != nil {
                
            cell.codeLabel.text = storageString
            storageString = nil
                
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = (screenSize.width/3)-1
        return CGSize(width: screenWidth, height: screenWidth);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedStatHeaders.insert(indexPath.row)
        if storageString != nil {
            
        collectionView.reloadItems(at: [indexPath])
            
        }else{
            
            allertControllerForNil()
        }
        print("Tapped item at index path: \(indexPath)")
    }
    

    func allertController(){
        
        let alert = UIAlertController(title: "Choose you product to add number:", message: storageString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            print(self.storageString as Any)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            self.storageString = nil
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func allertControllerForNil(){
        
        let alert = UIAlertController(title: "Please, scan QR to change product number", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
        }))

        present(alert, animated: true, completion: nil)
    }
 
}

extension ViewController: addQRStrinq_Delegate{
    
    func addString(qrString: QrData) {
        
        self.storageString = qrString.qrDataString
        
    }
}



