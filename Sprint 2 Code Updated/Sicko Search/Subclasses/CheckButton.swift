//
//  CheckButton.swift
//  Sicko Search
//
//  Created by rdickens on 3/16/19.
//  Copyright © 2019 rdickens. All rights reserved.
//

import UIKit

class CheckButton: UIButton {

    var isOn = false
    
    override init(frame:CGRect){
        super.init(frame:frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        initButton()
    }
    
    func initButton(){
       layer.borderWidth = 1.0
       layer.borderColor = Colors.lightBlue.cgColor
    
        
        setTitleColor(Colors.lightBlue, for: .normal)
        addTarget(self, action : #selector(CheckButton.buttonPressed), for : .touchUpInside)
    }
    
    @objc func buttonPressed(){
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool : Bool){
        isOn = bool
        
        let color = bool ? Colors.lightBlue : .clear
        let titleColor = bool ? .white : Colors.lightBlue
        
        
        setTitleColor(titleColor, for : .normal)
        backgroundColor = color
    }
}
