//
//  IdleState.swift
//  SwiftStateMachine
//
//  Created by Yasuo Hasegawa on 2021/04/15.
//

import Foundation

class IdleState:BaseState {
    override init(stateMachine: SwiftStateMachine, name:String) {
        super.init(stateMachine: stateMachine, name: name)
        print("IdleState constructor")
    }
    
    override func onEnter(state:SwiftState){
        print(">>>>> IdleState onEnter")
    }
    
    override func onExit(state:SwiftState){
        print(">>>>> IdleState onExit")
    }
    
    override func onUpdate(state:SwiftState){
        //print(">>>>> IdleState onUpdate")
    }
}
