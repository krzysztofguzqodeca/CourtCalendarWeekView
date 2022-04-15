//
//  AllDayViewModel.swift
//  JZCalendarWeekViewExample
//
//  Created by Jeff Zhang on 30/5/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import Foundation
import JZCalendarWeekView

class AllDayViewModel: NSObject {

    private let firstDate = Date().add(component: .hour, value: 1)
    private let secondDate = Date().add(component: .day, value: 1)
    private let thirdDate = Date().add(component: .day, value: 2)

    lazy var events = [AllDayEvent(id: "0", title: "One", startDate: firstDate, endDate: firstDate.add(component: .hour, value: 1), location: "Melbourne", isAllDay: false, section: 0),
                       AllDayEvent(id: "1", title: "Two", startDate: secondDate, endDate: secondDate.add(component: .hour, value: 4), location: "Sydney", isAllDay: false, section: 1),
                       AllDayEvent(id: "2", title: "Three", startDate: thirdDate, endDate: thirdDate.add(component: .hour, value: 2), location: "Tasmania", isAllDay: false, section: 2),
                       AllDayEvent(id: "3", title: "Four", startDate: thirdDate, endDate: thirdDate.add(component: .hour, value: 26), location: "Canberra", isAllDay: false, section: 3)]

    lazy var eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)
    lazy var eventsBySectionInt = JZWeekViewHelper.getIntraEventsBySectionInt(originalEvents: events)

    var currentSelectedData: OptionsSelectedData!
}
