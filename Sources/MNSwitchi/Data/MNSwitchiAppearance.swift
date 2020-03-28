//
//  MNSwitchiAppearance.swift
//  
//
//  Created by Mohamed Aberkane on 28/03/2020.
//

import UIKit

public struct MNSwitchiAppearance {
    
    let backgroundColor: UIColor
    let cornersRounded: Bool
    let selectedViewBackgroundColor: UIColor
    let states: MNSwitchiStates
    
    public init(backgroundColor: UIColor,
                cornersRounded: Bool,
                selectedViewBackgroundColor: UIColor,
                states: MNSwitchiStates) {
        
        self.backgroundColor = backgroundColor
        self.cornersRounded = cornersRounded
        self.selectedViewBackgroundColor = selectedViewBackgroundColor
        self.states = states
    }
}

public struct MNSwitchiStates {
    
    let `default`: MNSwitchiState
    let selected: MNSwitchiState
    let highlighted: MNSwitchiState
    
    public init(default: MNSwitchiState,
                selected: MNSwitchiState,
                highlighted: MNSwitchiState) {
        
        self.default = `default`
        self.selected = selected
        self.highlighted = highlighted
    }
    
    public struct MNSwitchiState {
        
        let textColor: UIColor
        let titleFont: UIFont
        
        public init(textColor: UIColor,
                    titleFont: UIFont) {
            
            self.textColor = textColor
            self.titleFont = titleFont
        }
    }
}
