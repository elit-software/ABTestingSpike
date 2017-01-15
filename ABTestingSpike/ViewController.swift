import UIKit
import Taplytics

class ViewController: UIViewController {

    @IBOutlet weak var happy: UIImageView!
    @IBOutlet weak var neutral: UIImageView!
    @IBOutlet weak var sad: UIImageView!

    var shouldUseEmojis: TaplyticsVar?

    override func viewDidLoad() {
        super.viewDidLoad()

        initTaplytics()
    }

    func initTaplytics() {
        let taplyticsVarName = "shouldUseEmojis"
        let defaultValue = false as NSObject
        shouldUseEmojis = TaplyticsVar(name: taplyticsVarName,
                                       defaultValue: defaultValue,
                                       updatedBlock: updatedBlock)
    }

    func updatedBlock(updatedValue: NSObject?) {
        updateUI()
    }

    func updateUI() {
        let shouldUseEmojis = self.shouldUseEmojis?.value as? Bool == true

        happy.image = shouldUseEmojis ? #imageLiteral(resourceName: "happy-emoji") : #imageLiteral(resourceName: "happy")
        neutral.image = shouldUseEmojis ? #imageLiteral(resourceName: "neutral-emoji") : #imageLiteral(resourceName: "neutral")
        sad.image = shouldUseEmojis ? #imageLiteral(resourceName: "sad-emoji") : #imageLiteral(resourceName: "sad")
    }
}
