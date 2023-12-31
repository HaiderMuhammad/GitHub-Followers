//
//  GFFollowerItemVC.swift
//  GitHub-Followers
//
//  Created by APPLE on 08/06/2023.
//

import UIKit



class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Git Followers")
    }
    
    override func actionButtonTaped() {
        delegate.didTapGetFollowers(for: user)
    }
}
