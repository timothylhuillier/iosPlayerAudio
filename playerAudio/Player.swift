//
//  Player.swift
//  playerAudio
//
//  Created by informatique on 09/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AVFoundation

class Player{
    
    var clientId:String = "6f56095a4b6389b2bf4265d7c3ab7232"
    var scApi:String = "http://api.soundcloud.com"
    
    func play(){
        
        self.getStreamUrl("https://soundcloud.com/matas/hobnotropic")
        
        let baseURL = NSURL(string: "https://api.soundcloud.com/tracks/49931/stream?client_id=\(clientId)")!
        print(baseURL)
        //var playerAvItem:AVPlayerItem = AVPlayerItem(URL: baseURL)
        let playerAV:AVPlayer = AVPlayer(URL: baseURL)
        playerAV.volume = 1.0
        playerAV.play()
        print(playerAV.status)
    }
    
    func search(tracksOrArtists: String){
        
        Alamofire.request(.GET, "\(self.scApi)/tracks?&client_id=\(self.clientId)").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let streamUrl:String = json["stream_url"].stringValue
                    
                    print(streamUrl)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func getTracksOrArtists(tracksOrArtists: String){
        
        
    }
    
    // Recupère l'url du stream
    func getStreamUrl(trackUrl: String){
        
        Alamofire.request(.GET, "\(self.scApi)/resolve?url=\(trackUrl)&client_id=\(self.clientId)").validate().responseJSON { response in
            switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let streamUrl:String = json["stream_url"].stringValue
                        
                        print(streamUrl)
                    }
                case .Failure(let error):
                    print(error)
            }
        }
    }
}