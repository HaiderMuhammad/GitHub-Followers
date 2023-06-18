//
//  GFSecondoryTitleLabel.swift
//  GitHub-Followers
//
//  Created by APPLE on 06/06/2023.
//

import UIKit

class GFSecondoryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
    private func configure() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        textAlignment               = .left
        textColor                   = .secondaryLabel
        font                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
        
    }
}
