//
//  BuildingCollectionViewCell.swift
//  WaterReflectionSound
//
//  Created by Fomagran on 2021/05/28.
//

import UIKit

class BuildingCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var waterView: UIView!
    @IBOutlet weak var buildingImageView:UIImageView!
    
    //MARK:- Helpers
    
    func setup(buildingImages:[UIImage]?,gradientColor:UIColor,backgroundColor:UIColor) {
        
        let images = buildingImages == nil ? [ #imageLiteral(resourceName: "orangeBuilding5"),#imageLiteral(resourceName: "orangeBuilding4"),#imageLiteral(resourceName: "orangeBuilding2"),#imageLiteral(resourceName: "orangeBuilding3"),#imageLiteral(resourceName: "orangeBuilding1")] : buildingImages!
        
        //cell background color
        self.backgroundColor = backgroundColor
        
        //imageview background color
        self.buildingImageView.backgroundColor = backgroundColor
        
        //set buildingImageView image to random building image
        buildingImageView.image = images.randomElement()
        
        //set gradient waterView
        waterView.setGradient(color1: gradientColor, color2: backgroundColor)
    }
}
