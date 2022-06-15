//
//  JZColumnHeader.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// Header for each column (section, day) in collectionView (Supplementary View)
open class JZColumnHeader: UICollectionReusableView {

    public var lblDay = UILabel()
    public var lblWeekday = UILabel()
    let calendarCurrent = Calendar.current
    public var dateFormatter = DateFormatter()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        backgroundColor = .clear
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Hide all content when colum header height equals 0
        self.clipsToBounds = true
        let stackView = UIStackView(arrangedSubviews: [lblDay, lblWeekday])
        stackView.axis = .vertical
        stackView.spacing = 3
        addSubview(stackView)
        stackView.setAnchorConstraintsEqualTo(centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)
        
        lblDay.textAlignment = .center
        lblWeekday.textAlignment = .center
        lblDay.font = UIFont.boldSystemFont(ofSize: 13)
        lblWeekday.font = UIFont.systemFont(ofSize: 12)
    }

    public func updateView(date: Date) {
        let weekday = calendarCurrent.component(.weekday, from: date) - 1

        lblDay.text = String(calendarCurrent.component(.day, from: date))
        lblWeekday.text = dateFormatter.shortWeekdaySymbols[weekday].uppercased()

        if date.isToday {
            lblDay.textColor = JZWeekViewColors.today
            lblWeekday.textColor = JZWeekViewColors.today
        } else {
            lblDay.textColor = JZWeekViewColors.columnHeaderDay
            lblWeekday.textColor = JZWeekViewColors.columnHeaderDay
        }
    }

    public func updateColumnHeaderView(court: CourtItem?) {
        guard let court = court else { return }
        lblDay.text = "Court: \(court.shortName ?? "") \n"
        lblDay.textColor = UIColor.white
    
       
        let fullString = NSMutableAttributedString(string: "")
        let ballImageAttachment = NSTextAttachment()
        if(court.ballMachine) {
            ballImageAttachment.image = UIImage(named: "court_view_machine")
        }
        let courtImageAttachment = NSTextAttachment()
        if(court.tennisCourtType?.code == "indoor") {
            courtImageAttachment.image = UIImage(named: "court_view_indoor")
        } else if(court.tennisCourtType?.code == "outdoor") {
            courtImageAttachment.image = UIImage(named: "court_view_outdoor")
        }
        
        if (courtImageAttachment.image != nil) {
            let courtImageString = NSAttributedString(attachment: courtImageAttachment)
            fullString.append(courtImageString)
        }
        
        if (ballImageAttachment.image != nil) {
            let space = NSAttributedString.init(string: "  ")
            let ballImageString = NSAttributedString(attachment: ballImageAttachment)
            fullString.append(space)
            fullString.append(ballImageString)
        }
        lblWeekday.attributedText = fullString
    }

}
