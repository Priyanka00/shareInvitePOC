//
//  NetworkConstant.swift
//  ShareInvitePOC
//
//  Created by Priyanka Sinha on 08/07/24.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
   
    public var serverAddress: String {
        get {
            return "\n \n https://www.lloydsbanking.com/invite=123"
        }
    }
    
    public var textMessage : String {
        get {
            return " Lloyds Banking Share Invites \n \n \n Hi, If you open this link and follow the instructions you can share your account details with me."
            
        }
        
    }
        
        public var message : String {
        
            get {
               return  " \n \n John Kelvin"
        }
        
    }
    
}
