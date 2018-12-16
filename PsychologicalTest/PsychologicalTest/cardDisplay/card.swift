//
//  card.swift
//  PsychologicalTest
//
//  Created by 402-24 on 15/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import Foundation
import SpriteKit

class Card: SKSpriteNode {
    
    var front: SKTexture!
    var back: SKTexture!
    var rotateRepet: SKAction?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:.)has not been implemented")
    }
    
    init(cardName: String) {
        
        self.front = SKTexture(imageNamed: cardName)
        self.back = SKTexture(imageNamed: cardName + "_back")
        
        let texture = SKTexture.init(imageNamed: cardName)
        super.init(texture: self.front, color: UIColor.white, size: texture.size())
        isUserInteractionEnabled = true
        
        

        
        // 흔들리는 효과 주기
        
        // 흔들리는 각도 시계방향, 반시계방향
        let rotateCCW = SKAction.rotate(byAngle: CGFloat(-M_1_PI / 10), duration: 0.1)
        let rotateCW = SKAction.rotate(byAngle: CGFloat(M_1_PI / 10), duration: 0.1)
        
        let rotate = SKAction.sequence([rotateCW, rotateCCW])
        
        // 반복적으로 흔들리도록 효과 주기
        rotateRepet = SKAction.repeatForever(rotate)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let liftUp = SKAction.scale(to: CardDisplayScene.cardScale * 1.2, duration: 0.2)
        run(liftUp)
        run(rotateRepet!, withKey: "rotate")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dropDown = SKAction.scale(to: CardDisplayScene.cardScale, duration: 0.2)
        run(dropDown)
        
        removeAction(forKey: "rotate")
        let rotate = SKAction.rotate(byAngle: 0, duration: 0)
        run(rotate)
        self.texture = self.back
        
        //let fileNmae = "CardSpark"
        let fileNmae = "CardMagic"
        
        if let sparkParticlePath: String = Bundle.main.path(forResource: fileNmae, ofType: ".sks") {
            let sparkParticleNode = NSKeyedUnarchiver.unarchiveObject(withFile: sparkParticlePath) as! SKEmitterNode
            self.addChild(sparkParticleNode)


            let alert = UIAlertController(title: "Notice", message: "결과를 공유 하시겠습니까?", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { _ in
                //alert.dismiss(animated: true, completion: nil)
                self.shareHandler(nil, alert: alert)
            }
            
            let actionNo = UIAlertAction(title: "NO", style: .default, handler: {
                _ in
                alert.dismiss(animated: true, completion: nil)
            })

            alert.addAction(actionOK)
            alert.addAction(actionNo)
            
            self.scene?.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func shareHandler(_ action: UIAlertAction!, alert: UIAlertController) { alert.dismiss(animated: true, completion: nil)
        let shareTxt = "당신은 나에게 이런 의미입니다."
        let shareImg = UIImage(cgImage: (self.texture?.cgImage)!())
        let shareItems = [shareTxt, shareImg] as [Any]
        let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.scene?.view?.window?.rootViewController? .present(activityController, animated: true, completion: nil)
    }
    
}
