//
//  DataManager.swift
//  HW2.9-Animations
//
//  Created by Айдар Рахматуллин on 12.11.2020.
//
import Spring

class DataManager {
    
    static let data = DataManager()
    
    let animations = Spring.AnimationPreset.allCases
    let curves = Spring.AnimationCurve.allCases
    
    private init() {}
}
