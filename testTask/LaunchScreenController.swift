//
//  LaunchScreenController.swift
//  testTask
//
//  Created by Виталий on 12/19/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "launch")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.78
            
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: Int(-(diffX/2)),
                y: Int(diffY),
                width: Int(size),
                height: Int(size)
            )
            self.imageView.alpha = 0
            
        }, completion: { done in
            
            if done{
                let layout = UICollectionViewFlowLayout()
                let viewController = UINavigationController(rootViewController: ViewController(collectionViewLayout: layout))
                viewController.modalTransitionStyle = .crossDissolve
                self.present(viewController, animated: true)
            }
        })
    }
}
