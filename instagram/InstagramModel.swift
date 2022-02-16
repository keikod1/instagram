//
//  InstagramModel.swift
//  instagram
//
//  Created by my macbook on 15/2/22.
//

import Foundation

class InstagramModel {
    var publicPhoto: String? = nil
    var profilePhoto: String? = nil
    var publicName: String? = nil
    
    init(publicPhoto: String, profilePhoto: String, publicName: String){
        self.publicPhoto = publicPhoto
        self.profilePhoto = profilePhoto
        self.publicName = publicName
    }
    init(profilePhoto: String, publicName: String){
        self.profilePhoto = profilePhoto
        self.publicName = publicName
    }
}
