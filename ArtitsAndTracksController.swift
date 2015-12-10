//
//  ArtitsAndTracksController.swift
//  playerAudio
//
//  Created by informatique on 10/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import UIKit
import SwiftyJSON

class ArtitsAndTracksController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive : Bool = false
    
    var clientId:String = "6f56095a4b6389b2bf4265d7c3ab7232"
    var player:Player = Player()
    var json:JSON! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* Setup delegates */
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        
        self.player.search("Laurent Garnier", callback: {
            (json : JSON) in self.json = json
             print(self.json[0])
            
            self.tableView.reloadData()
        })
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.player.search(searchText, callback: {
            (json : JSON) in self.json = json
            
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.json.count)
        return self.json.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellule")! as UITableViewCell
        
        cell.textLabel?.text = self.json[indexPath.row]["title"].stringValue
        cell.detailTextLabel?.text = self.json[indexPath.row]["description"].stringValue
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        self.player.play()
    }

}