//
//  OnboardingCVCell.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 25.02.2023.
//

import UIKit
import Lottie

class OnboardingCVCell: UICollectionViewCell, UITextViewDelegate {
    //MARK: - Properties
    
    var animation = LottieAnimationView()
    
    private let cellView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let dividerView : UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = .gray.withAlphaComponent(0.5)
        return dividerView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Title"
        label.font = .systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        return label
    }()
    
    private let descriptionTextView : UITextView = {
        
        let textView = UITextView(frame: .zero)
        textView.text = "Some Text"
        textView.textColor = .black
        textView.textAlignment = .left
        textView.textColor = .lightGray
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 23, weight: UIFont.Weight.medium)
        
        textView.backgroundColor = .secondarySystemBackground
        textView.textColor = .secondaryLabel
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.layer.cornerRadius = 20
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        textView.layer.shadowOpacity = 0.4
        textView.layer.shadowRadius = 20
        textView.layer.masksToBounds = false
        textView.layer.cornerRadius = 20
        textView.textContainer.maximumNumberOfLines = 10
        textView.textContainer.lineBreakMode = .byTruncatingTail
        return textView
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        descriptionTextView.delegate = self
        style()
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func style () {
        
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            
            //MARK: - CellView Constraint
            
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 1),
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -1),
            cellView.heightAnchor.constraint(equalToConstant: (contentView.frame.size.height) / 2),
            
            //MARK: - Title Label Constraint
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo:cellView.bottomAnchor, constant: contentView.frame.size.height / 5),
            
            //MARK: - Description TextView Constraint
            
            descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionTextView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            //MARK: - Divider View Constraint
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            dividerView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 30),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
    
    
    //MARK: - Animation Play Func
    func setupAnimation(_ animations : Animation) {
        animation = LottieAnimationView(name: animations.animationName)
        animation.frame = CGRect(x: 0, y: 0, width: self.frame.width  , height: self.frame.height * 0.8)
        animation.animationSpeed = 0.7
        animation.loopMode = .loop
        animation.clipsToBounds = true
        animation.play()
       addSubview(animation)
        
        self.titleLabel.text = animations.title
        self.descriptionTextView.text = animations.description
    }
    
}
