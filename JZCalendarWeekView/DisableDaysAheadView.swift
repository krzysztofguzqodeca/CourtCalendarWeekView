//
//  DisableDaysAheadView.swift
//  BayClubConnect
//
//  Created by Krzysztof Guz on 12/08/2022.
//  Copyright © 2022 Bay Clubs. All rights reserved.
//

import Foundation
import UIKit

class DisableDaysAheadView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration

    private func configure() {
        backgroundColor = UIColor(hexString: "#8D8D8E")
        self.alpha = 0.75
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 3))
        lineView.backgroundColor = UIColor(hexString: "#008E9E")
        self.addSubview(lineView)
        let lockIconView = UIView(frame: CGRect(x: -12, y: -5, width: 16, height: 16))
        lockIconView.backgroundColor = UIColor(hexString: "#008E9E")
        lockIconView.layer.cornerRadius = 8
        
        let lockIconImage = UIImageView(frame: CGRect(x: 4, y: 4, width: 8, height: 8))
        lockIconImage.image = UIImage(named: "court_lock")
        lockIconImage.backgroundColor = UIColor(hexString: "#008E9E")
        lockIconView.addSubview(lockIconImage)
        
        self.addSubview(lockIconView)
    }
}
