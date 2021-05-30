import Foundation

public class FomaViewableSoundViewController:UIViewController {
    
    
    @IBOutlet weak var testLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    func setupUI() {
        self.testLabel.text = "FomaViewableSound"
    }
    
    
}
