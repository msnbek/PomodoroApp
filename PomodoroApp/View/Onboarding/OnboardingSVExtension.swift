//
//  OnboardingSVExtension.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 7.03.2023.
//

import UIKit

extension OnboardingViewController {
     func setUpView() {
        onboardingView.pageControl.numberOfPages = OnboardingViewController.animations.count
        view.backgroundColor = .white
        buttonHandle()
       view.addSubview(onboardingView)
        view.addSubview(onboardingView.collectionView)
        view.addSubview(onboardingView.pageControl)
        view.addSubview(onboardingView.skipButton)
        view.addSubview(onboardingView.nextButton)
        onboardingView.collectionView.translatesAutoresizingMaskIntoConstraints = false
        onboardingView.pageControl.translatesAutoresizingMaskIntoConstraints = false
        onboardingView.skipButton.translatesAutoresizingMaskIntoConstraints = false
        onboardingView.nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            

            //CollectionView Constraints
            onboardingView.collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            onboardingView.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: onboardingView.collectionView.trailingAnchor, constant: 0),
            onboardingView.collectionView.bottomAnchor.constraint(equalTo:onboardingView.pageControl.topAnchor ,constant: -5),
            
            //PageControl Constraints
            onboardingView.pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.size.height / 5.75)),
            onboardingView.pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
       
            
            //NextButton Constraints
            onboardingView.nextButton.topAnchor.constraint(equalTo: onboardingView.pageControl.bottomAnchor, constant: 20),
            onboardingView.nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingView.nextButton.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.06),
            onboardingView.nextButton.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.8),
            
            //SkipButton Constraints
            onboardingView.skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height / 13),
            view.trailingAnchor.constraint(equalTo: onboardingView.skipButton.trailingAnchor, constant: 25),
            onboardingView.skipButton.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.11),
            onboardingView.skipButton.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.06)
            
        ])
        
    }
}
