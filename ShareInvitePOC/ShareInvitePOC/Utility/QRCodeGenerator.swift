//
//  QRCodeGenerator.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 09/07/24.
//

import UIKit
import CoreImage

class QRCodeGenerator {
    class func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}

