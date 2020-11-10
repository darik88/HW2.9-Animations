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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 10
        animationView.isHidden = true
    }

    @IBAction func actionButtonPressed(_ sender: SpringButton) {
        animationView.isHidden = false
        updateAnimationView()
    }
    
    private func updateAnimationView() {
        let animation = Animation(
            preset: getRandomAnimationPreset(),
            curve: getRandomAnimationCurve(),
            duration: Float.random(in: 0.5...3),
            force: Float.random(in: 0.5...3))
        
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.duration = CGFloat(animation.duration)
        animationView.force = CGFloat(animation.force)
        
        animationPresetLabel.text = "Preset: \(animation.preset)"
        animationCurveLabel.text = "Curve: \(animation.curve)"
        animationForceLabel.text = "Force: \(animation.force)"
        animationDurationLabel.text = "Duration: \(animation.duration)"
        
        animationView.animate()
    }
    
    private func getRandomAnimationPreset() -> String {
        // enum AnimationPreset подписал под протокол CaseIterable
        let animationPresets = Spring.AnimationPreset.allCases
        let random = Int.random(in: 0..<animationPresets.count)
        return animationPresets[random].rawValue
    }
    
    private func getRandomAnimationCurve() -> String {
        // enum AnimationCurve подписал под протокол CaseIterable
        let animationCurves = Spring.AnimationCurve.allCases
        let random = Int.random(in: 0..<animationCurves.count)
        return animationCurves[random].rawValue
    }
}

