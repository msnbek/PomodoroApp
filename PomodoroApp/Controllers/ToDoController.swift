//
//  ToDoController.swift
//  PomodoroApp
//
//  Created by Veysel Akbalık on 25.02.2023.
//

import UIKit

class ToDoController: UIViewController {
    
    // MARK: - UI Elements
    let homeView = ToDoView()
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        setUpView()
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        
    }
    
    // MARK: - Functions
    private func setUpView(){
        view.addSubview(homeView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        ])
    }
    // MARK: - Actions
}


extension ToDoController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ToDoCollectionViewCell.cellIdentifier,
            for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellTapped()
    }
    func cellTapped(){
        let vc = ToDoTableViewController()
        present(vc, animated: true)
        
    }
    
}
