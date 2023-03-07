//
//  OnboardingViewController.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 18.02.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    //MARK: - Properties
    var onboardingView = OnboardingView()
    var currentPage = 0 {
        didSet {
            onboardingView.pageControl.currentPage = currentPage
            if currentPage == OnboardingViewController.animations.count - 1 {
                onboardingView.nextButton.setTitle("Start", for: UIControl.State.normal)
            }else {
                onboardingView.nextButton.setTitle("Next", for: UIControl.State.normal)
            }
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.collectionView.delegate = self
        onboardingView.collectionView.dataSource = self
        setUpView()
       
        print(view.frame.size.width)
        print(view.frame.size.height)
        
    }
    
    //MARK: - Functions
   
}

//MARK: - Actions Button

extension OnboardingViewController {
    //Button Add Target
     func buttonHandle() {
        
        onboardingView.nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        onboardingView.skipButton.addTarget(self, action: #selector(skipButtonClicked), for: .touchUpInside)
    }
    //Next Button
    @objc func nextButtonClicked(_ sender : Any) {
        
        if currentPage == OnboardingViewController.animations.count - 1 {
            
            onboardingView.nextButton.addTarget(self, action: #selector(startButtonClicked), for: UIControl.Event.touchUpInside)
            
        } else {
            currentPage += 1
            let indexPath =  IndexPath(item: currentPage, section: 0)
            onboardingView.collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        }
   
    }
    
    @objc func startButtonClicked() {
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        let pushVC = UINavigationController(rootViewController: TabBarController())
        pushVC.modalTransitionStyle = .coverVertical
        pushVC.modalPresentationStyle = .fullScreen
        self.present(pushVC, animated: true)
        
    }
    //Skip Button
    @objc func skipButtonClicked() {
        
        let pushVC = UINavigationController(rootViewController: TabBarController())
        pushVC.modalTransitionStyle = .coverVertical
        pushVC.modalPresentationStyle = .fullScreen
        self.present(pushVC, animated: true)
        
    }
}

//MARK: - Collection View Delegates
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        OnboardingViewController.animations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCVCell
        cell.setupAnimation(OnboardingViewController.animations[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCVCell
        cell.setupAnimation(OnboardingViewController.animations[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

//MARK: - Scroll View Funcs
extension OnboardingViewController {
    //When scroll finish.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onboardingView.collectionView.reloadData()
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / witdh)
        onboardingView.pageControl.currentPage = currentPage
        print(currentPage)
    }
    
}
