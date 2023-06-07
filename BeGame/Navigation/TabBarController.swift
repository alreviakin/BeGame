//
//  TabBarController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 23.05.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case main
    case play
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = R.Color.blue
        
        let controllers: [UINavigationController] = Tabs.allCases.map { tab in
            let controller = UINavigationController(rootViewController: getController(tab: tab))
            controller.tabBarItem = UITabBarItem(
                title: getBarTitle(tab: tab),
                image: getBarImage(tab: tab),
                tag: tab.rawValue)
            switch tab {
            case .main:
                controller.navigationBar.prefersLargeTitles = true
            case .play:
                controller.navigationBar.prefersLargeTitles = false
            }
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    
    private func getController(tab: Tabs) -> UIViewController {
        switch tab {
        case .main:
            return MainController()
        case .play:
            return GameSelectionTableViewController()
        }
    }
    
    private func getBarTitle(tab: Tabs) -> String {
        switch tab {
        case .main:
            return "Главный"
        case .play:
            return "Начать игру"
        }
    }
    
    private func getBarImage(tab: Tabs) -> UIImage {
        switch tab {
        case .main:
            return R.TabBar.Image.main
        case .play:
            return R.TabBar.Image.play
        }
    }

}
