//
//  ViewController.swift
//  FomaViewableSound
//
//  Created by fomagran on 05/29/2021.
//  Copyright (c) 2021 fomagran. All rights reserved.
//

import UIKit
import FomaViewableSound

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let foma = FomaViewableSound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            foma.show(on: self.view, in: self)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

