//
//  GameState.swift
//  SwiftStateMachine
//
//  Created by Yasuo Hasegawa on 2021/04/15.
//

import Foundation

class GameState:BaseState {
    override init(stateMachine: SwiftStateMachine, name:String) {
        super.init(stateMachine: stateMachine, name: name)
        print("GameState constructor")
    }
    
    override func onEnter(state:SwiftState){
        print(">>>>> GameState onEnter")
    }
    
    override func onExit(state:SwiftState){
        print(">>>>> GameState onExit")
    }
    
    override func onUpdate(state:SwiftState){
        //print(">>>>> GameState onUpdate")
    }
}
