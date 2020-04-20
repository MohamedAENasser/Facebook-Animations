//
//  ViewController.swift
//  FacebookAnimations
//
//  Created by Mohamed Abd ElNasser on 4/20/20.
//  Copyright © 2020 MohamedAENasser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<30 {
            view.addSubview(createEmoji(random: CGFloat(drand48())))
        }
    }

    func createEmoji(random: CGFloat) -> UIImageView {
        var imageName = "reaction"
        switch random {
        case 0..<0.15:
            imageName += "1"
        case 0..<0.3:
            imageName += "2"
        case 0..<0.5:
            imageName += "3"
        case 0..<0.7:
            imageName += "4"
        case 0..<0.85:
            imageName += "5"
        default:
            imageName += "6"
        }

        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.layer.add(emojiAnimation(random: random),
                            forKey: nil)
        return imageView
    }

    func emojiAnimation(random: CGFloat) -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 2 + drand48()*3
        animation.isRemovedOnCompletion = false
        animation.path = animationPath(random: random).cgPath

        return animation
    }

    func animationPath(random: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()

        let basicY: CGFloat = 200
        let initialPoint = CGPoint(x: 0, y: basicY)
        path.move(to: initialPoint)

        let finalX = UIScreen.main.bounds.maxX + 50
        let finalPoint = CGPoint(x: finalX, y: basicY)
        let cp1 = CGPoint(x: finalX/3, y: (basicY-100)-(random*100))
        let cp2 = CGPoint(x: finalX*0.75, y: (basicY+100)+(random*100))
        path.addCurve(to: finalPoint, controlPoint1: cp1, controlPoint2: cp2)
        path.stroke()
        path.lineWidth = 5

        return path
    }
}
