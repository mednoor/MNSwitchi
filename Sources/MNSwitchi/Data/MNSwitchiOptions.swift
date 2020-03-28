//
//  MNSwitchiOptions.swift
//  
//
//  Created by Mohamed Aberkane on 28/03/2020.
//

import Foundation

public struct MNSwitchiOptions {
    
    let defaultSelectedItem: Int
    let enableAnimation: Bool
    
    public init(defaultSelectedItem: Int,
                enableAnimation: Bool) {
        
        self.defaultSelectedItem = defaultSelectedItem
        self.enableAnimation = enableAnimation
    }
}
