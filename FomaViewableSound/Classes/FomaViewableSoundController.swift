import UIKit
import AVFoundation


@available(iOS 13.0, *)
public class FomaViewableSoundViewController: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var fomaViewableSoundLabel: UILabel!
    @IBOutlet weak var sunButton: GlowingButton!
    @IBOutlet weak var buildingCollection: UICollectionView!
    
    //MARK:- Properties
    
    //timerInterval
    private let updateInterval = 1
    
    // Internal Timer to schedule updates from player
    private var timer: Timer?

    // Ingected Player to get power Metrics
    private var player: AVAudioPlayer!
    
    //Detect playing or stop
    private var isPlaying:Bool = false
    
    //sounds powers
    private var powers:[CGFloat] = [0]
    
    //currentTime
    private var time:Int = 0
    
    //play song title
    var songTitle:String!
    
    //showing building images
    var buildingImages:[UIImage]?
    
    //set gradient color
    var gradinetColor:UIColor!
    
    //set background color
    var backgroundColor:UIColor!
    
    
    //MARK:- Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK:- IBActions
    
    @IBAction func tapSunButton(_ sender: Any) {
        //set button
        isPlaying ? stop() : start()
        isPlaying.toggle()
    }
    
    
    //MARK:- Helpers
    
    private func configure() {
        
        setSound()
        self.view.backgroundColor = backgroundColor
        sunButton.backgroundColor = .clear
        sunButton.glowColor = gradinetColor
        fomaViewableSoundLabel.textColor = gradinetColor
        
    }
    
    private func setSound() {
        
        guard let url = Bundle.main.url(forResource: self.songTitle, withExtension:"mp3") else { return print("no url")}
        do {
            //set audio session active
            try AVAudioSession.sharedInstance().setActive(true)
            //set player song url and song type
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            //guard player
            guard let player = player else { return print("no player")}
            //set array duration length
            powers = Array(repeating: 0, count:Int(floor( player.duration + 1)) )
            //set metering
            player.isMeteringEnabled = true
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(updateInterval),target: self,selector: #selector(self.updateMeters),userInfo: nil,repeats: true)
        sunButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        player.play()
        sunButton.startAnimation()
    }

    func stop() {
        guard timer != nil, timer!.isValid else { return }
        timer?.invalidate()
        timer = nil
        sunButton.setImage(UIImage(systemName: "play.fill"),for: .normal)
        player.pause()
        sunButton.stopAnimations()
    }

    @objc private func updateMeters() {
        player.updateMeters()
        //average of channel
        let power = averagePowerFromAllChannels()
        //current time
        let index = self.time
        //set heights building
        if floor(abs(power))*10 < 400 {
            powers[index] = 400 - floor(abs(power))*10
        }else {
            powers[index] = 400
        }
        //reload last item
        buildingCollection.reloadItems(at: [IndexPath(item: index, section: 0)])
        //scroll to right
        buildingCollection.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
        //end stop
        powers.count - 10 > time ? time += 1 : stop()
 
    }

    // Calculate average power from all channels
    private func averagePowerFromAllChannels() -> CGFloat {
        var power: CGFloat = 0.0
        (0..<player.numberOfChannels).forEach { (index) in
            power = power + CGFloat(player.averagePower(forChannel: index))
        }
        return power
    }
}

//MARK:-  UICollectionViewDataSource

@available(iOS 13.0, *)
extension FomaViewableSoundViewController:UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return duration count
        return powers.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = buildingCollection.dequeueReusableCell(withReuseIdentifier: "BuildingCollectionViewCell", for: indexPath) as! BuildingCollectionViewCell
        //setup building image and gradient color and background color
        cell.setup(buildingImages: buildingImages, gradientColor: gradinetColor, backgroundColor: backgroundColor)
        return cell
    }
}

//MARK- UICollectionViewDelegateFlowLayout

@available(iOS 13.0, *)
extension FomaViewableSoundViewController:UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: powers[indexPath.item]/2)
    }
}
