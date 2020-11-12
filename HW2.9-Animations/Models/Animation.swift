//
//  Animation.swift
//  HW2.9-Animations
//
//  Created by Айдар Рахматуллин on 10.11.2020.
//

struct Animation {
    let preset: String
    let curve: String
    let duration: Float
    let force: Float
    
    var description: String {
        """
        Preset: \(preset),
        Curve: \(curve),
        Duration: \(String(format: "%.2f", duration)),
        Force: \(String(format: "%.2f", force)),
        """
    }
    
    static func getRandomAnimation() -> Animation {
        
        let data = DataManager.data
        let animation = data.animations[Int.random(in: 0..<data.animations.count)]
        let curve = data.curves[Int.random(in: 0..<data.curves.count)]
        
        return Animation(
            preset: animation.rawValue,
            curve: curve.rawValue,
            duration: Float.random(in: 0.5...3),
            force: Float.random(in: 0.5...3))
    }
}
