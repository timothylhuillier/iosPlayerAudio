//
//  ViewController.swift
//  playerAudio
//
//  Created by informatique on 09/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON

class ViewController: UIViewController {
    
    var clientId:String = "6f56095a4b6389b2bf4265d7c3ab7232"
    var player:Player = Player()
    var json:JSON = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.player.search("Laurent Garnier", callback: {(json : JSON) in self.json = json})
        
        //self.player.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

