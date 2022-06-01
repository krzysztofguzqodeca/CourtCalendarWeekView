//
//  CourtItem.swift
//  JZCalendarWeekView
//
//  Created by Krzysztof Guz on 18/05/2022.
//  Copyright © 2022 Bayclubs. All rights reserved.
//

import Foundation

// MARK: - Item
open class CourtItem: Codable {
    public let courtID, name, shortName, itemDescription: String?
    let ballMachine: Bool
    let category, tennisCourtType, visibilityOption: CategoryType?
    public let openingHours: [ItemOpeningHour]?
    let categoryOption: CategoryOption?
    public let availability: [ItemAvailability]?

    enum CodingKeys: String, CodingKey {
        case courtID = "courtId"
        case name, shortName
        case itemDescription = "description"
        case ballMachine, category, tennisCourtType, visibilityOption, openingHours, categoryOption, availability
    }

    init(courtID: String, name: String, shortName: String, itemDescription: String, ballMachine: Bool, category: CategoryType, tennisCourtType: CategoryType, visibilityOption: CategoryType, openingHours: [ItemOpeningHour], categoryOption: CategoryOption, availability: [ItemAvailability]) {
        self.courtID = courtID
        self.name = name
        self.shortName = shortName
        self.itemDescription = itemDescription
        self.ballMachine = ballMachine
        self.category = category
        self.tennisCourtType = tennisCourtType
        self.visibilityOption = visibilityOption
        self.openingHours = openingHours
        self.categoryOption = categoryOption
        self.availability = availability
    }
}
