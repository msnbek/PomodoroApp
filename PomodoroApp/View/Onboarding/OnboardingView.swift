//
//  OnboardingView.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 25.02.2023.
//

import UIKit

class OnboardingView : UIView {
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView( frame: .zero, collectionViewLayout: layout)
        collectionView.register(OnboardingCVCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.layoutSubviews()
        collectionView.alwaysBounceHorizontal = true
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        layout.minimumLineSpacing = 0
        
        return collectionView
        
    }()
    
    let pageControl : UIPageControl = {
        
        let pageControl = UIPageControl(frame: .zero)
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.contentMode = .scaleToFill
        pageControl.isUserInteractionEnabled = true
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.clipsToBounds = true
        pageControl.isUserInteractionEnabled = false
        
        return pageControl
        
    }()
    
    let nextButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Next", for: UIControl.State.normal)
        button.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.contentMode = .scaleToFill
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        
        return button
        
    }()
    
    
    let skipButton : UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Skip", for: UIControl.State.normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.numberOfLines = 0
        button.clipsToBounds = true
        button.contentHorizontalAlignment = .fill
        
        return button
        
    }()
    
    
    
    
}
