//
//  SwiftStateMachine.swift
//  stateMachineTest
//
//  Created by Yasuo Hasegawa on 2021/04/15.
//

import Foundation

class SwiftStateConfig {
    var name:String? = ""
    var onEnter:((SwiftState) -> Void)? = nil
    var onExit:((SwiftState) -> Void)? = nil
    var onUpdate:((SwiftState) -> Void)? = nil
    
    init(){
        
    }
}

class SwiftState {
    var name:String = ""
    var onEnter:((SwiftState) -> Void)? = nil
    var onExit:((SwiftState) -> Void)? = nil
    var onUpdate:((SwiftState) -> Void)? = nil
    
    init(config:SwiftStateConfig) {
        self.name = ((config.name == nil || config.name == "") ? "NewState":config.name) ?? ""
        self.onEnter = config.onEnter;
        self.onExit = config.onExit;
        self.onUpdate = config.onUpdate;
    }
}

class SwiftStateMachine {
    var name:String = ""
    var currentState:SwiftState?
    var states: Dictionary<String,SwiftState> = [:]
    var stateCount = 0;
    var interval = 0.1;
    var onUpdateAll:(() -> Void)? = nil
    var onStateChanged:((String,String) -> Void)? = nil
    var printDebug = false
    
    init(name:String?){
        self.name = ((name == nil || name == "") ? "NewStateMachine" : name) ?? ""
        
        Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true) { timer in
            self.update()
        }
    }
    
    func addState(config:SwiftStateConfig)->SwiftState {
        let newState = SwiftState(config:config)
    
        self.states[newState.name] = newState;
        self.stateCount = self.stateCount+1;
        return newState;
    }
    
    func enterState(stateName:String) {
        if (self.states[stateName] == nil) {
            print("[STATE]: Invalid state name: " + stateName);
            return;
        }
    
        let oldStateName = ((self.currentState?.name == nil) ? nil : self.currentState?.name) ?? ""
        
        if (self.currentState != nil) {
            self.exitState();
        }
    
        self.currentState = self.states[stateName];
    
        if (self.printDebug) {
            print("[STATE]: Entering State: " + self.currentState!.name);
        }
    
        if (self.currentState!.onEnter != nil) {
            self.currentState!.onEnter?(self.currentState!);
        }
    
        if (self.onStateChanged != nil) {
            self.onStateChanged?(self.currentState!.name, oldStateName);
        }
    }
    
    func exitState() {
        if (self.currentState == nil) {
            return;
        }
    
        if (self.currentState!.onExit != nil) {
            self.currentState!.onExit?(self.currentState!);
        }
    }
    
    func update() {
        if (self.currentState == nil) {
            return;
        }

        if (self.currentState!.onUpdate != nil) {
            self.currentState!.onUpdate?(self.currentState!);
        }
    
        if (self.onUpdateAll != nil) {
            self.onUpdateAll?();
        }
    }
}
