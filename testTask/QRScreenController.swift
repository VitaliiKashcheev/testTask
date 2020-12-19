//
//  QRScreenController.swift
//  testTask
//
//  Created by Виталий on 12/17/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit
import AVFoundation

protocol addQRStrinq_Delegate {
    func addString(qrString: QrData)
}

class QRScreenController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    weak var viewController: ViewController?
    
    var delegate: addQRStrinq_Delegate?
    
    var video = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideo()
    }
    
    func setupVideo() {
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch {
            fatalError(error.localizedDescription)
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]

        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
    }
    
    func startRunning() {
        view.layer.addSublayer(video)
        session.startRunning()
    }
    
        
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard metadataObjects.count > 0 else { return }
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            if object.type == AVMetadataObject.ObjectType.qr {
//                let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
                
                guard let textScreen = object.stringValue else {
                    print("Err")
                    return
                }
                
                let qrStrings = QrData(qrDataString: textScreen)
                
                delegate?.addString(qrString: qrStrings)
                    UIPasteboard.general.string = object.stringValue
                    self.view.layer.sublayers?.removeLast()
                    self.session.stopRunning()
                navigationController?.popToRootViewController(animated: true)
                    print(object.stringValue as Any)
//                }))
//
//                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
////                    print(object.stringValue)
//                }))
                
//                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
}
