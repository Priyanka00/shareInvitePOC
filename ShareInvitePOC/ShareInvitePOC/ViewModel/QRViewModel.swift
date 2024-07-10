//
//  QRViewModel.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 09/07/24.
//

import Foundation
import UIKit

class QRViewModel {
    func generateQRCode(from string: String, completion: @escaping (UIImage?) -> Void) {
        // Generate QR Code
        if let qrCode = QRCodeGenerator.generateQRCode(from: string) {
            completion(qrCode)
        } else {
            completion(nil)
        }
    }
    
    func fetchQRDataFromAPI(completion: @escaping (String?) -> Void) {
        // Make API call to fetch data
        // Replace with your API call logic
        // Example:
        // URLSession.shared.dataTask(with: URL(string: "https://your-api-url.com")!) { (data, response, error) in
        //    guard let data = data else { completion(nil); return }
        //    let qrData = String(data: data, encoding: .utf8)
        //    completion(qrData)
        // }.resume()
        
        // For demonstration, we simulate data fetch
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion("Data from API")
        }
    }
}

