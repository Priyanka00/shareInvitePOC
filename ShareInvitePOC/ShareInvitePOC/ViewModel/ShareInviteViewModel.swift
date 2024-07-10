//
//  ShareInviteViewModel.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 08/07/24.
//

import Foundation
import UIKit

protocol ShareInviteViewModelDelegate : AnyObject{
    func showData(item:ShareInviteModel)
}

class ShareInviteViewModel {
    
    weak var delegate:ShareInviteViewModelDelegate?
    let shareInviteModel:ShareInviteModel
    
  
    init(shareScreenModel:ShareInviteModel) {
        self.shareInviteModel = shareScreenModel
    }
    
    //---assigning data in items--//
    func getData (){
        
        DispatchQueue.main.async { [weak self] in
        
            self?.delegate?.showData(item: self!.shareInviteModel)
        }
      }
    
   }
