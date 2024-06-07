//
//  CustomTabBar.swift
//  TestsSwiftUIkit
//
//  Created by Adrian Prieto Villena on 6/6/24.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func build() -> CustomTabBarController {
        self
    }

    private func setupUI() {
        tabBar.backgroundColor = .white
        let carrouselViewController = CarrouselViewController()
        let carrouselNavigationController = UINavigationController(rootViewController: carrouselViewController)
        let dropDownViewController = DropDownViewController()
        let dropDownNavigationController = UINavigationController(rootViewController: dropDownViewController)
        let tabBarList = [dropDownNavigationController,carrouselNavigationController]
        self.setViewControllers(tabBarList, animated: true)

        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(systemName: "arrow.down")
        items[0].title = "DropDown"
        items[1].image = UIImage(systemName: "photo.on.rectangle")
        items[1].title = "Carrousel"

        self.tabBar.itemPositioning = .centered
    }
}
