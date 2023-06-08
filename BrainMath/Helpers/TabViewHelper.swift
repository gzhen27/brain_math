//
//  TabViewHelper.swift
//  BrainMath
//
//  Created by G Zhen on 6/7/23.
//

import SwiftUI

func customizeTabViewStyle() {
    let appearance = UITabBarAppearance()
    
    // selected tab colors
    appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UICustomColor.primary as Any]
    appearance.stackedLayoutAppearance.selected.iconColor = UICustomColor.primary

    // unselected tab colors
    appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UICustomColor.secondary as Any]
    appearance.stackedLayoutAppearance.normal.iconColor = UICustomColor.secondary
    
    // tab bar background color
    appearance.backgroundColor = UICustomColor.backgroundColor
    
    UITabBar.appearance().standardAppearance = appearance
    UITabBar.appearance().scrollEdgeAppearance = appearance
}
