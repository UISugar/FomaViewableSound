# 👟 FomaViewableSound 👟

[![CI Status](https://img.shields.io/travis/fomagran/FomaViewableSound.svg?style=flat)](https://travis-ci.org/fomagran/FomaViewableSound)  

[![Version](https://img.shields.io/cocoapods/v/FomaViewableSound.svg?style=flat)](https://cocoapods.org/pods/FomaViewableSound)   

[![License](https://img.shields.io/badge/Licese-MIT-blueviolet)](https://cocoapods.org/pods/FomaViewableSound)   

[![Platform](https://img.shields.io/badge/Platform-iOS-yellow)](https://cocoapods.org/pods/FomaViewableSound)   

[![Language](https://img.shields.io/badge/Swift-5.0-orange)](https://cocoapods.org/pods/FomaViewableSound)   

[![Author](https://img.shields.io/badge/Author-Fomagran-green)](https://cocoapods.org/pods/FomaViewableSound)   

## Usage

First you have to import 'FomaViewableSound'   

```swift
import 'FomaViewableSound'
```

and alseo you have to make FomaViewableSound instance   

```
let fomaViewableSound = FomaViewableSound()
```

and present on the view controller you want to   

```swift
 @IBAction func tapShowButton(_ sender: Any) {
 
//if you don't have building images
fomaViewableSound.show(in: self, songTitle: "song title", buildingImages: nil, gradientColor: .systemOrange, backgroundColor: .black)

//or if you have building images
fomaViewableSound.show(in: self, songTitle: "song title", buildingImages: images, gradientColor: .systemOrange, backgroundColor: .black)

}
```

<img src="https://user-images.githubusercontent.com/47676921/120883516-9d916b80-c618-11eb-9948-5766c768a870.gif"  width="200" height="400">

## Requirements

* iOS 13
* Xcode 12
* Swift 5.0

## Installation

FomaViewableSound is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FomaViewableSound'
```

## Author

fomagran, fomagran6@naver.com

## License

FomaViewableSound is available under the MIT license. See the LICENSE file for more info.
