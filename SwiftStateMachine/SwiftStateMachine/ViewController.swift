//
//  ViewController.swift
//  SwiftStateMachine
//
//  Created by Yasuo Hasegawa on 2021/04/15.
//

import UIKit

class ViewController: UIViewController {
    var stateMachine:SwiftStateMachine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("idle", for: UIControl.State.normal)
        btn.setTitleColor(.green, for: .normal)
        btn.backgroundColor = .gray
        btn.tag = 0
        view.addSubview(btn)
        btn.addTarget(self,action: #selector(self.OnTap(_ :)),for: .touchUpInside)
        
        let btn2 = UIButton()
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn2.setTitle("home", for: UIControl.State.normal)
        btn2.setTitleColor(.green, for: .normal)
        btn2.backgroundColor = .gray
        btn2.tag = 1
        view.addSubview(btn2)
        btn2.addTarget(self,action: #selector(self.OnTap(_ :)),for: .touchUpInside)
        
        let btn3 = UIButton()
        btn3.translatesAutoresizingMaskIntoConstraints = false
        btn3.setTitle("game", for: UIControl.State.normal)
        btn3.setTitleColor(.green, for: .normal)
        btn3.backgroundColor = .gray
        btn3.tag = 2
        view.addSubview(btn3)
        btn3.addTarget(self,action: #selector(self.OnTap(_ :)),for: .touchUpInside)
        
        let margineGuide = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            btn.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor),
            btn.heightAnchor.constraint(equalToConstant: 40),
            btn.trailingAnchor.constraint(equalTo: margineGuide.trailingAnchor),
            
            btn2.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 20),
            btn2.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor),
            btn2.heightAnchor.constraint(equalToConstant: 40),
            btn2.trailingAnchor.constraint(equalTo: margineGuide.trailingAnchor),
            
            btn3.topAnchor.constraint(equalTo: btn2.bottomAnchor, constant: 20),
            btn3.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor),
            btn3.heightAnchor.constraint(equalToConstant: 40),
            btn3.trailingAnchor.constraint(equalTo: margineGuide.trailingAnchor)
        ])
        
        self.view = view
        
        stateMachine = SwiftStateMachine(name: "StateMachine")
        stateMachine!.onStateChanged = onStateChanged
        
        _ = IdleState(stateMachine: stateMachine!, name: "IdleState")
        _ = HomeState(stateMachine: stateMachine!, name: "HomeState")
        _ = GameState(stateMachine: stateMachine!, name: "GameState")
        
        stateMachine?.enterState(stateName: "IdleState")
    }

    @objc func OnTap(_ sender: UIButton){
        print(">>>>> OnTap: \(sender.tag)")
        switch sender.tag {
        case 0:
            stateMachine?.enterState(stateName: "IdleState")
            break
        case 1:
            stateMachine?.enterState(stateName: "HomeState")
            break
        case 2:
            stateMachine?.enterState(stateName: "GameState")
            break
        default: break
            
        }
    }
    
    func onStateChanged(current:String, prev:String) {
        print(">>>>> onStateChanged current: \(current) prev: \(prev)")
    }
}

