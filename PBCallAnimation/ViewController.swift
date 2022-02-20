//
//  ViewController.swift
//  PBCallAnimation
//
//  Created by Pankaj Bawane on 19/02/22.
//

import UIKit

class ViewController: UIViewController {

    private var callIconCenter: CGPoint = CGPoint.zero
    private let callIconSize: CGFloat = 130.0
    private let containerView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.27, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        callIconCenter = CGPoint(x: view.center.x, y: view.center.y - callIconSize)
        
        setupContainerView()
        
        addRippleToCallIcon(diameterOffset: 30.0, opacity: 0.4)
        addRippleToCallIcon(diameterOffset: 65.0, opacity: 0.2)
        addRippleToCallIcon(diameterOffset: 100.0, opacity: 0.1)
        
        addImageView()
        addLabels()
    }
    
    private func setupContainerView() {
        containerView.frame = CGRect(x: 0.0, y: 0.0, width: callIconSize, height: callIconSize)
        containerView.center = callIconCenter
        view.addSubview(containerView)
    }

    private func addRippleToCallIcon(diameterOffset: CGFloat, opacity: Double) {
        let duration: Double = 1.0
        let diameter: CGFloat = callIconSize
        let maxDiameter = diameter + diameterOffset
        let scale: CGFloat = maxDiameter / diameter
        
        let rippleLayer = CAShapeLayer()
        rippleLayer.frame = containerView.bounds
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: .zero, size: containerView.frame.size))
        rippleLayer.path = circlePath.cgPath
        rippleLayer.fillColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        rippleLayer.opacity = Float(opacity)
        
        containerView.layer.addSublayer(rippleLayer)
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.fromValue = CGAffineTransform.identity
        animation.toValue = scale
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        rippleLayer.add(animation, forKey: nil)
        
    }
    
    private func addImageView() {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: callIconSize, height: callIconSize)
        imageView.center = callIconCenter
        imageView.layer.cornerRadius = imageView.frame.width / 2.0
        view.addSubview(imageView)
        view.bringSubviewToFront(imageView)
        
        imageView.image = UIImage(named: "drstrange")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let imageLayer = imageView.layer
        imageLayer.cornerRadius = imageView.frame.width / 2.0
        imageLayer.borderWidth = 3.0
        imageLayer.borderColor = UIColor.white.cgColor
        
        let imageAnimation = CABasicAnimation(keyPath: "transform.scale")
        imageAnimation.duration = 1.0
        imageAnimation.repeatCount = .infinity
        imageAnimation.fromValue = 1.15
        imageAnimation.toValue = 1.0
        imageAnimation.autoreverses = true
        imageAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        imageLayer.add(imageAnimation, forKey: nil)
    }
    
    private func addLabels() {
        let callingLabel = UILabel()
        callingLabel.frame.origin = CGPoint(x: 20.0, y: view.frame.maxY - 200.0)
        callingLabel.frame.size = CGSize(width: view.frame.width - 40.0, height: 25.0)
        callingLabel.font = .systemFont(ofSize: 20.0, weight: .light)
        callingLabel.textColor = .white
        callingLabel.text = "Calling..."
        callingLabel.textAlignment = .center
        view.addSubview(callingLabel)
        
        let nameLabel = UILabel()
        nameLabel.frame.origin = CGPoint(x: 20.0, y: view.frame.maxY - 175.0)
        nameLabel.frame.size = CGSize(width: view.frame.width - 40.0, height: 25.0)
        nameLabel.font = .systemFont(ofSize: 25.0, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.text = "Doctor Strange"
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
    }

}

