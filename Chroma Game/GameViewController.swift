import UIKit
import SpriteKit
import GameplayKit

var SKViewSize: CGSize?
var SKViewSizeRect: CGRect?

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let view = self.view as! SKView? {
      SKViewSize = view.bounds.size
      
      if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
        scene.scaleMode = .aspectFill
        
        view.presentScene(scene)
        SKViewSizeRect = getViewSizeRect()
        scene.sizeColorWheel()
      }
      
      view.ignoresSiblingOrder = true

    }
  }
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .landscape
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  func getViewSizeRect() -> CGRect {
    return CGRect(x: ((SKViewSize!.width  * 0.5) * -1.0), y: ((SKViewSize!.height * 0.5) * -1.0), width: SKViewSize!.width, height: SKViewSize!.height)
  }
}
