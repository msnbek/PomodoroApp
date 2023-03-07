//
//  TabBarController.swift
//  PomodoroApp
//
//  Created by Veysel Akbalık on 25.02.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - UI Elements
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTabs()
    }
    
    // MARK: - Functions
    private func setUpTabs() {
        let homeVC = HomeController()
        let toDoVC  = ToDoController()
        let settingsVC   = SettingsController()
        let timerVC = TimerController()
        
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: toDoVC)
        let nav3 = UINavigationController(rootViewController: timerVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
       
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "ToDo", image: UIImage(systemName: "list.clipboard"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(systemName: "timer"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        let font = [NSAttributedString.Key.font:UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)]
        nav1.tabBarItem.isSpringLoaded = true
        
        for nav in [nav1,nav2,nav3, nav4] {
            nav.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 5)
            
            nav.tabBarItem.setTitleTextAttributes(font as [NSAttributedString.Key : Any], for: UIControl.State.normal)
        }
        
        setViewControllers([nav1,nav2,nav3, nav4], animated: true)
        
        
        
        self.tabBar.tintColor = .systemMint
        self.tabBar.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        self.tabBarController?.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 5, bottom: 10, right: 5)
        self.tabBar.itemPositioning = .fill
        self.tabBar.unselectedItemTintColor = .systemGray
        // MARK: - Actions
        
    }
}
