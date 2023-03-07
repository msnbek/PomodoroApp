//
//  ToDoCollectionViewCell.swift
//  PomodoroApp
//
//  Created by Veysel Akbalık on 25.02.2023.
//

import UIKit

class ToDoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "ToDoCollectionViewCell"
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(textLabel)
        contentView.addSubview(deleteButton)
        addConstraints()
        style()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    private let textLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        
        
        return label
    }()
    
    private let deleteButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: UIControl.State.normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(ToDoCollectionViewCell.self, action: #selector(deleteTapped), for: UIControl.Event.touchUpInside)
        
        return button
    }()
    
    //MARK: - Helpers
    @objc func deleteTapped(){
        print("delete tapped")

    }
    
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            textLabel.heightAnchor.constraint(equalToConstant: 50),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor ),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10),
            
            
        ])
    }
    
    private func style(){
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = 5
    }
}
