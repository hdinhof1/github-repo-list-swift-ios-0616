//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    private init() {}
    
    var repositories : [GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ())  {
        repositories.removeAll()
        GithubAPIClient.getRepositoriesWithCompletion { (responseData) in
            
            //for case let repo as [String: AnyObject] in responseData  {
            for i in 0...1 {
                
                if let data = responseData[i] as? [String: AnyObject] {
                    
                    let newRepo =  GithubRepository(dictionary: data)
                    
                    self.repositories.append(newRepo)
                }
            }
            print (self.repositories)
            completion()
        }
        print(self.repositories)
        
    }
}
