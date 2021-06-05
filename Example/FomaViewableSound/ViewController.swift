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
        let images = [ #imageLiteral(resourceName: "orangeBuilding5"),#imageLiteral(resourceName: "orangeBuilding4"),#imageLiteral(resourceName: "orangeBuilding2"),#imageLiteral(resourceName: "orangeBuilding3"),#imageLiteral(resourceName: "orangeBuilding1")]
 
        foma.show(in: self, songTitle: "기다린 만큼 더", buildingImages: images, gradientColor: .systemOrange, backgroundColor: .black)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

