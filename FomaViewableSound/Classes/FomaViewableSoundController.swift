import Foundation
import AVFoundation

@available(iOS 13.0, *)
public class FomaViewableSoundViewController: UIViewController {
    
    // Configuration Settings
    private let updateInterval = 1
    private let animatioтDuration = 0.05
    private let maxPowerDelta: CGFloat = 30
    private let minScale: CGFloat = 0.9

    // Internal Timer to schedule updates from player
    private var timer: Timer?

    // Ingected Player to get power Metrics
    var player: AVAudioPlayer!

    var heights:[CGFloat] = [0]
    var time:Int = 0
    var isPlaying:Bool = false
    
    @IBOutlet weak var sunButton: GlowingButton!
    @IBOutlet weak var buildingCollection: UICollectionView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setSound()
       
    }
    @IBAction func tapSunButton(_ sender: Any) {
        
        isPlaying ? stop() : start()
        isPlaying.toggle()
    }
    
    
    func setSound() {
        guard let url = Bundle.main.url(forResource: "기다린 만큼 더", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            let duration = player.duration
            heights = Array(repeating: 0, count:Int(floor(duration + 1)) )
            player.isMeteringEnabled = true
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(updateInterval),
                                     target: self,
                                     selector: #selector(self.updateMeters),
                                     userInfo: nil,
                                     repeats: true)
        sunButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        player.play()
        sunButton.startAnimation()
    }

    func stop() {
        guard timer != nil, timer!.isValid else {
            return
        }
        timer?.invalidate()
        timer = nil
        sunButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        player.pause()
        sunButton.stopAnimations()
    }

    @objc private func updateMeters() {
        player.updateMeters()
        let power = averagePowerFromAllChannels()
        let index = self.time
        heights[index] = 200 - floor(abs(power))*10/2
        buildingCollection.reloadItems(at: [IndexPath(item: index, section: 0)])
        if index > 10 {
            buildingCollection.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
        }
        if heights.count-1 > time {
            time += 1
        }else {
            stop()
        }
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

@available(iOS 13.0, *)
extension FomaViewableSoundViewController:UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heights.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = buildingCollection.dequeueReusableCell(withReuseIdentifier: "BuildingCollectionViewCell", for: indexPath) as! BuildingCollectionViewCell

        return cell
    }
}

@available(iOS 13.0, *)
extension FomaViewableSoundViewController:UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: heights[indexPath.item])
    }
}
