// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - CourtViewBookingClubAvailability
open class CourtViewBookingClubAvailability: Codable {
    let canCreateBookings: Bool
    public let daysAheadLimit, maxAllowedTimeOfBookingInMinutes, minAllowedTimeOfBookingInMinutes: Int?
    let isAfterMaxAllowedBookingDate: Bool
    public let items: [CourtItem]?

    public init(canCreateBookings: Bool, daysAheadLimit: Int?, maxAllowedTimeOfBookingInMinutes: Int?, minAllowedTimeOfBookingInMinutes: Int?, isAfterMaxAllowedBookingDate: Bool, items: [CourtItem]?) {
        self.canCreateBookings = canCreateBookings
        self.daysAheadLimit = daysAheadLimit
        self.maxAllowedTimeOfBookingInMinutes = maxAllowedTimeOfBookingInMinutes
        self.minAllowedTimeOfBookingInMinutes = minAllowedTimeOfBookingInMinutes
        self.isAfterMaxAllowedBookingDate = isAfterMaxAllowedBookingDate
        self.items = items
    }
}

// MARK: - Availability
open class ItemAvailability: Codable {
    public let fromInMinutes, toInMinutes: Int?
    public let timeOfDay: String?
    public let courtsVersionsIDS: [String]?
    public let unavailability: ItemUnavailability?
    public let courtID: String?

    enum CodingKeys: String, CodingKey {
        case fromInMinutes, toInMinutes, timeOfDay
        case courtsVersionsIDS = "courtsVersionsIds"
        case unavailability
        case courtID = "courtId"
    }

    init(fromInMinutes: Int, toInMinutes: Int, timeOfDay: String, courtsVersionsIDS: [String], unavailability: ItemUnavailability, courtID: String) {
        self.fromInMinutes = fromInMinutes
        self.toInMinutes = toInMinutes
        self.timeOfDay = timeOfDay
        self.courtsVersionsIDS = courtsVersionsIDS
        self.unavailability = unavailability
        self.courtID = courtID
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUnavailability { response in
//     if let unavailability = response.result.value {
//       ...
//     }
//   }

// MARK: - Unavailability
open class ItemUnavailability: Codable {
    let reason, message: String?
    let bookingStarts: BookingStarts?

    init(reason: String, message: String, bookingStarts: BookingStarts) {
        self.reason = reason
        self.message = message
        self.bookingStarts = bookingStarts
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBookingStarts { response in
//     if let bookingStarts = response.result.value {
//       ...
//     }
//   }

// MARK: - BookingStarts
open class BookingStarts: Codable {
    let date: DateClass?
    let timeInMinutes: Int?

    init(date: DateClass, timeInMinutes: Int) {
        self.date = date
        self.timeInMinutes = timeInMinutes
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDateClass { response in
//     if let dateClass = response.result.value {
//       ...
//     }
//   }

// MARK: - DateClass
open class DateClass: Codable {
    let value: String?

    init(value: String) {
        self.value = value
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCategory { response in
//     if let category = response.result.value {
//       ...
//     }
//   }

// MARK: - Category
open class CategoryType: Codable {
    let code, name: String?

    init(code: String, name: String) {
        self.code = code
        self.name = name
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCategoryOption { response in
//     if let categoryOption = response.result.value {
//       ...
//     }
//   }

// MARK: - CategoryOption
open class CategoryOption: Codable {
    let ballMachine: Bool
    let timeSlots: [TimeSlot]?

    init(ballMachine: Bool, timeSlots: [TimeSlot]) {
        self.ballMachine = ballMachine
        self.timeSlots = timeSlots
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTimeSlot { response in
//     if let timeSlot = response.result.value {
//       ...
//     }
//   }

// MARK: - TimeSlot
open class TimeSlot: Codable {
    let durationInMinutes: Int?
    let name: String?

    init(durationInMinutes: Int, name: String) {
        self.durationInMinutes = durationInMinutes
        self.name = name
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseItemOpeningHour { response in
//     if let itemOpeningHour = response.result.value {
//       ...
//     }
//   }

// MARK: - ItemOpeningHour
open class ItemOpeningHour: Codable {
    public let dayOfWeek: String?
    public let openingHours: [OpeningHourOpeningHour]?

    init(dayOfWeek: String, openingHours: [OpeningHourOpeningHour]) {
        self.dayOfWeek = dayOfWeek
        self.openingHours = openingHours
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOpeningHourOpeningHour { response in
//     if let openingHourOpeningHour = response.result.value {
//       ...
//     }
//   }

// MARK: - OpeningHourOpeningHour
open class OpeningHourOpeningHour: Codable {
    public let fromInMinutes, toInMinutes: Int?

    init(fromInMinutes: Int, toInMinutes: Int) {
        self.fromInMinutes = fromInMinutes
        self.toInMinutes = toInMinutes
    }
}
