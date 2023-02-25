//
//  LottieAnimation.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 25.02.2023.
//

import Foundation

struct Animation {
    
    let animationName : String
    let title : String
    let description : String
    
}

extension OnboardingViewController {
    
    static let animations : [Animation] =
    
    [Animation(animationName: "animation1", title: "Learn to Code", description: "Find awesome tutorials on how to code and improve your conding practies"),
     Animation(animationName: "animation2", title: "Code with Friends", description: "Pratice with friends and solve problems together to earn points"),
     Animation(animationName: "animation3", title: "Always there to help", description: "Having trouble? Get guidance from our experienced Mentors"),

    ]
    
    
}
