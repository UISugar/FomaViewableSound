//
//  FomaViewableSound.swift
//  FomaViewableSound
//
//  Created by Fomagran on 2021/05/30.
//

import UIKit
import AVFoundation

@available(iOS 13.0, *)
public class FomaViewableSound {
    
    public init() {}

    // Bundle
    static var bundle: Bundle {
        return Bundle(for: FomaViewableSoundViewController.self)
    }

    // FomaViewableSound view controller
    public lazy var vc: FomaViewableSoundViewController = {
        return UIStoryboard(name: "FomaViewableSound", bundle: FomaViewableSound.bundle).instantiateViewController(withIdentifier: "FomaViewableSoundViewController") as! FomaViewableSoundViewController
    }()
    
    public func show(in parent: UIViewController,songTitle:String,buildingImages:[UIImage]?,gradientColor:UIColor,backgroundColor:UIColor) {
        vc.songTitle = songTitle
        vc.buildingImages = buildingImages
        vc.gradinetColor = gradientColor
        vc.backgroundColor = backgroundColor
        
        DispatchQueue.main.async {
            parent.present(self.vc, animated: true, completion: nil)
        }
        
    }
}
