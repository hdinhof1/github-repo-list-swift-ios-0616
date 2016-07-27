//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let store = ReposDataStore.sharedInstance
    
    var VCCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
    
        VCCount += 1
        print ("Loaded up a new TVC \(VCCount)")
                                                //weakSelf is an optional
        store.getRepositoriesWithCompletion { [weak weakSelf = self ] in
//            print (weakSelf?.store.repositories)
                                                                //with unowned make sure that you are not getting rid of me.foo() before the ReposTVControler
            NSOperationQueue.mainQueue().addOperationWithBlock({ [unowned me = self ] in
                me.tableView.reloadData()
                
            })
        }
       
    }
    deinit {
        VCCount -= 1
        print ("Removed a TVC \(VCCount)")
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = store.repositories[indexPath.row].fullName as String
        
        return cell
    }
    // MARK: - Table view data source
    
    
}
