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
    
    static func getAnimations() -> [Animation] {
        
        var animations: [Animation] = []
        let data = DataManager.data
        
        for _ in 0..<data.animations.count {
            
            let randomAnimation = data.animations[Int.random(in: 0..<data.animations.count)]
            let randomCurve = data.animations[Int.random(in: 0..<data.animations.count)]
            
            animations.append(
                Animation(
                    preset: randomAnimation.rawValue,
                    curve: randomCurve.rawValue,
                    duration: Float.random(in: 0.5...3),
                    force: Float.random(in: 0.5...3))
            )
        }
        
        return animations
    }
}
