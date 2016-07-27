//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository : CustomStringConvertible {
    
    let fullName : NSString
    let htmlURL : NSURL
    let repositoryID : NSString
    
    convenience init() {
        self.init(fullName: "", htmlURL: NSURL(string: "")!, repoID: "")
    }
    
    init(fullName : NSString, htmlURL: NSURL, repoID: NSString) {
        
        self.fullName = fullName
        self.htmlURL = htmlURL
        self.repositoryID = repoID
        
    }
    convenience init (dictionary: [String : AnyObject] ) {
        if  let person = dictionary["full_name"] as? NSString,
            let htmlURL = dictionary["html_url"] as? String,
            let repositoryID = dictionary["id"]
        {
            
            let repoIDString = "\(repositoryID)" as NSString
            let urlInit = NSURL(string: htmlURL)
            
            self.init(fullName: person, htmlURL: urlInit!, repoID: repoIDString)
        } else {
            self.init()
        }
    }
    var description : String {
        return "\n\n\(fullName)\n\(htmlURL)\n\(repositoryID)"
    }
}
