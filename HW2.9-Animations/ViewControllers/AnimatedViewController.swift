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
    
    @IBOutlet var animationLabel: UILabel!
    
    var animation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 10
        animationView.isHidden = true
    }

    @IBAction func actionButtonPressed(_ sender: SpringButton) {
        animationView.isHidden = false
        updateAnimationView()
        sender.setTitle("Try \(animation.preset)", for: .normal)
    }
    
    private func updateAnimationView() {
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.duration = CGFloat(animation.duration)
        animationView.force = CGFloat(animation.force)
        
        animationLabel.text = animation.description
        animationView.animate()
        
        animation = Animation.getRandomAnimation()
    }
}

