//
//  ViewController.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 08/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shareInviteButton: UIButton!
    var shareInviteViewModel : ShareInviteViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        shareInviteButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    @IBAction func shareInviteButton(_ sender: Any) {
        
 
        let shareText = "Hey, \(NetworkConstants.shared.textMessage) \(NetworkConstants.shared.serverAddress) \(NetworkConstants.shared.message)"
                
        let textToShare = [shareText]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
        
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

