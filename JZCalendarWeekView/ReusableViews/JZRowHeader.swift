//
//  JZRowHeader.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// Header for each row (every hour) in collectionView (Supplementary View)
open class JZRowHeader: UICollectionReusableView {

    public var lblTime = UILabel()
    public var dateFormatter = DateFormatter()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
        setupBasic()
    }

    private func setupLayout() {
        self.addSubview(lblTime)
        // This one is used to support iPhone X Landscape state because of notch status bar
        // If you want to customise the RowHeader, please keep the similar contraints with this one (vertically center and a value to trailing anchor)
        // If you want to change rowHeaderWidth and font size, you can change the trailing value to make it horizontally center in normal state, but keep the trailing anchor
        lblTime.setAnchorCenterVerticallyTo(view: self, trailingAnchor: (self.trailingAnchor, 0))
        lblTime.setAnchorCenterVerticallyTo(view: self, leadingAnchor: (self.leadingAnchor, 5))
        //lblTime.setAnchorConstraintsEqualTo(topAnchor: (self.topAnchor, 15))

    }

    open func setupBasic() {
        // Hide all content when colum header height equals 0
        self.clipsToBounds = true
        dateFormatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        lblTime.textColor = JZWeekViewColors.rowHeaderTime
        lblTime.numberOfLines = 2
        lblTime.textAlignment = .center
        lblTime.font = UIFont.boldSystemFont(ofSize: 12)
    }

    public func updateView(date: Date) {
        lblTime.text = dateFormatter.string(from: date)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
