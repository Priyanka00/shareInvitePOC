//
//  ShareInviteModel.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 08/07/24.
//

import Foundation

class ShareInviteModel{
    
    var textMsg = NetworkConstants.shared.textMessage
    var url = NetworkConstants.shared.serverAddress
  
     init(textMsg: String, url:String) {
        self.textMsg = textMsg
        self.url = url
      
        
    }
    
}
