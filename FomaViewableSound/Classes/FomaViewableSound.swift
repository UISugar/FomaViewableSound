//
//  FomaViewableSound.swift
//  FomaViewableSound
//
//  Created by Fomagran on 2021/05/30.
//

import Foundation

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
    
    public func show(on: UIView, in parent: UIViewController) {
        parent.present(vc, animated: true, completion: nil)
    }

}
