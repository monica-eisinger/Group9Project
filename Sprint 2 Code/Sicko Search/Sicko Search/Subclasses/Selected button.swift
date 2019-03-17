//
//  Selected button.swift
//  Sicko Search
//
//  Created by rdickens on 3/17/19.
//  Copyright © 2019 rdickens. All rights reserved.
//

import UIKit

class Selected_button: UIButton {
    
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
       // layer.borderWidth = 2.0
        //layer.cornerRadius = frame.size.height/2
        //layer.borderColor = Colors.lightBlue.cgColor
        
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
