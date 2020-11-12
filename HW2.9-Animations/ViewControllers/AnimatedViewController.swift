//
//  AnimatedViewController.swift
//  HW2.9-Animations
//
//  Created by Айдар Рахматуллин on 10.11.2020.
//

import Spring

class AnimatedViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet var actionButton: SpringButton!
    
    @IBOutlet var animationPresetLabel: UILabel!
    @IBOutlet var animationCurveLabel: UILabel!
    @IBOutlet var animationForceLabel: UILabel!
    @IBOutlet var animationDurationLabel: UILabel!
    
    let animations = Animation.getAnimations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 10
        animationView.isHidden = true
    }

    @IBAction func actionButtonPressed(_ sender: SpringButton) {
        animationView.isHidden = false
        updateAnimationView()
        sender.setTitle("Next animation", for: .normal)
    }
    
    private func updateAnimationView() {
        let random = Int.random(in: 0..<animations.count)
        
        let currentAnimation = animations[random]
        
        animationView.animation = currentAnimation.preset
        animationView.curve = currentAnimation.curve
        animationView.duration = CGFloat(currentAnimation.duration)
        animationView.force = CGFloat(currentAnimation.force)

        animationPresetLabel.text = "Preset: \(animationView.animation)"
        animationCurveLabel.text = "Curve: \(animationView.curve)"
        animationForceLabel.text = "Force: \(String(format: "%.2f",animationView.force))"
        animationDurationLabel.text = "Duration: \(String(format: "%.2f", animationView.duration))"
        animationView.animate()
    }
}

