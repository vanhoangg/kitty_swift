import Foundation
enum Months: Int {
    case January = 1
    case February = 2
    case March = 3
    case April = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12

}
extension Months {
    func title() -> String {
        switch self {
        case Months.January:
            return "Jan"
        case Months.February:
            return "Feb"
        case Months.March:
            return "Mar"
        case Months.April:
            return "Apr"
        case Months.May:
            return "May"
        case Months.June:
            return "June"
        case Months.July:
            return "July"
        case Months.August:
            return "Aug"
        case Months.September:
            return "Sep"
        case Months.October:
            return "Oct"
        case Months.November:
            return "Nov"
        case Months.December:
            return "Dec"
        }
    }

}
extension String {
    func getMonthType() -> Months {

        switch self {
        case "January":
            return Months.January
        case "February":
            return Months.February
        case  "March":
            return Months.March
        case "April":
            return Months.April
        case "May":
            return Months.May
        case "June":
            return Months.June
        case "July":
            return Months.July
        case "August":
            return Months.August
        case "September":
            return Months.September
        case "October":
            return Months.October
        case "November":
            return Months.November
        case "December":
            return Months.December
        default:
            return Months.December
        }
    }
}

class FunctionUtils {
    static func createDateFromMonth(monthRawValue: Int?, pattern: String? = StringUtils.defaultPatternDate) -> Date? {
        let calendar = Calendar.current
        var components = DateComponents()
        let now = Date()
        components.day = calendar.component(.day, from: now)
        components.month = monthRawValue
        components.year = calendar.component(.year, from: now)
        let newDate = calendar.date(from: components)

        return newDate
    }
}
