//
//  HomeState.swift
//  SwiftStateMachine
//
//  Created by Yasuo Hasegawa on 2021/04/15.
//

import Foundation

class HomeState:BaseState {
    override init(stateMachine: SwiftStateMachine, name:String) {
        super.init(stateMachine: stateMachine, name: name)
        print("HomeState constructor")
    }
    
    override func onEnter(state:SwiftState){
        print(">>>>> HomeState onEnter")
    }
    
    override func onExit(state:SwiftState){
        print(">>>>> HomeState onExit")
    }
    
    override func onUpdate(state:SwiftState){
        //print(">>>>> HomeState onUpdate")
    }
}
