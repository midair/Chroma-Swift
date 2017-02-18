import SpriteKit
import GameplayKit

class GameScene: SKScene {
  var colorWheelScale: CGFloat = 1.0
  
  private var backgroundNode : SKNode?
  private var colorWheelNode: SKSpriteNode?
  private var colorSelectionNode: SKSpriteNode?
  
  override func didMove(to view: SKView) {
    colorSelectionNode = self.childNode(withName: "//Color Selection") as? SKSpriteNode
    colorWheelNode = self.childNode(withName: "//Color Wheel") as? SKSpriteNode
    colorSelectionNode?.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 10)))
    colorWheelNode?.run(SKAction.repeatForever(SKAction.rotate(byAngle: -CGFloat(M_PI), duration: 10)))
    
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    colorWheelNode?.run(SKAction.scale(to: 1.5, duration: 2)) {
      self.colorWheelNode?.run(SKAction.scale(to: self.colorWheelScale, duration: 2))
    }
  }
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
  }
  
  func sizeColorWheel() {
    if let viewHeight = SKViewSizeRect?.height,
      let currentHeight = colorWheelNode?.size.height {
      colorWheelScale = (viewHeight * 0.75)/currentHeight
      colorWheelNode?.setScale(colorWheelScale)
    }
  }
}
