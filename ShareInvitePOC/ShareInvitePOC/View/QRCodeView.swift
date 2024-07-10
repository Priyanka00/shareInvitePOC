//
//  QRCodeView.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 10/07/24.
//

import UIKit

protocol ViewControllerProtocol {
    func cancelButtonTapped()
    
}

class QRCodeView: UIView {

    var delegate : ViewControllerProtocol?
    
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // Load the XIB file
        
        let nib = UINib(nibName: "QRCodeView", bundle: nil)
        if let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(contentView)
            backGroundView.layer.cornerRadius = 40
            contentTextView.text = "1. Show this code to your parents. \n2. Your parents will scan this QR code on their device. \n3. Your parent will then select the lloyds bank accounts they want to share."
        }
    }
    
    func configure(with qrImage: UIImage) {
        qrCodeImageView.image = qrImage
        // Configure other UI elements as needed with the runtime data
    }
    
    
   
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        
        self.delegate?.cancelButtonTapped()
    }
    
    
}




