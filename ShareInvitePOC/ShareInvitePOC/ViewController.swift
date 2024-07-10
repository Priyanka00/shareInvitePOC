//
//  ViewController.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 08/07/24.
//

import UIKit

class ViewController: UIViewController{
   
    
    @IBOutlet weak var shareInviteButton: UIButton!
    var shareInviteViewModel : ShareInviteViewModel?
    
    @IBOutlet weak var qrCodeView: QRCodeView!
    //QR Code scanner variables
   // var qrCodeView : QRCodeView?
    @IBOutlet weak var qrCodeButton: UIButton!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    let viewModel = QRViewModel()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        qrCodeView.isHidden = true
        qrCodeImageView.isHidden = true
        shareInviteButton.layer.cornerRadius = 20
        qrCodeButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
   
    func showAnimate(tempView : UIView){
        
        qrCodeView?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        qrCodeView?.alpha = 0.0;
        UIView.animate(withDuration: 0.75, animations: { [self] in
            qrCodeView?.alpha = 1.0
            qrCodeView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    @IBAction func qrCodeButtonTapped(_ sender: Any) {
        qrCodeImageView.isHidden = false
        

        viewModel.fetchQRDataFromAPI { [weak self] qrData in
                   guard let qrData = qrData else { return }
            
                   self?.qrCodeView.isHidden = false
                    self?.viewModel.generateQRCode(from: qrData) { qrCode in
                    self?.qrCodeView.configure(with: qrCode!)
                       
                    }
               }
       
        }
       

    
    @IBAction func shareInviteButton(_ sender: Any) {
        
 
        let shareText = "Hey, \(NetworkConstants.shared.textMessage) \(NetworkConstants.shared.serverAddress) \(NetworkConstants.shared.message)"
                
        let textToShare = [shareText]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
//        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
        
    }
    
}

extension ViewController : ViewControllerProtocol {
    
    func cancelButtonTapped() {
        
      //  isViewOpen=false
        print("Cancel Tapped")
        qrCodeView?.removeFromSuperview()
        
    }
    
    
    
}
extension ViewController: ShareInviteViewModelDelegate {
    
    func showData(item: ShareInviteModel) {
      
        let text = item.textMsg
        let url = item.url
                
                // set up activity view controller
                let textToShare = [ text , url]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    
}

