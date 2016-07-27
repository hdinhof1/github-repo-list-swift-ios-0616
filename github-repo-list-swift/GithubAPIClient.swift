//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        if let githubURL = NSURL(string: api_URL) {
            
            let githubTask = session.dataTaskWithURL(githubURL) { (data, response, error) in
                
                if let data = data {
                    
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! NSArray
                    
                        completion(responseData)
                        
                    }catch {
                        print (error)
                    }
                }
            }
            githubTask.resume()
        }
    }
}

