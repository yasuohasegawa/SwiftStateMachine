//
//  BaseState.swift
//  stateMachineTest
//
//  Created by Yasuo Hasegawa on 2021/04/15.
//

import Foundation

class BaseState {
    init(stateMachine:SwiftStateMachine, name:String) {
        let config = SwiftStateConfig()
        config.name = name
        config.onEnter = onEnter
        config.onExit = onExit
        config.onUpdate = onUpdate
        
        _ = stateMachine.addState(config: config)
    }
    
    func onEnter(state:SwiftState){
        
    }
    
    func onExit(state:SwiftState){
        
    }
    
    func onUpdate(state:SwiftState){
        
    }
}
