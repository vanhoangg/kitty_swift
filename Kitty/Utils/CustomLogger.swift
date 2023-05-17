import Foundation
import OSLog

class Log {
    #if DEBUG
    static let logLevel = "deiwv"
    #else
    static let logLevel = "e"
    #endif
    static var subsystem = Bundle.main.bundleIdentifier ?? ""
    static var flags = ["e": " 🔴 Error:",
                        "w": " ⚠️ Warning:",
                        "i": " 💡 Information:",
                        "d": " 🐛 Debug:",
                        "v": " 👾 Verbose:"
                  ]

    static func setup(_ fileStr: String, _ funcStr: String, _ line: Int, _ level: String) -> String {
        var fileName = fileStr.components(separatedBy: "/").last ?? ""
//        fileName = fileName.components(separatedBy: ".").first ?? ""
        fileName = fileName.padding(toLength: 30, withPad: " ", startingAt: 0)
        let funcString = funcStr.padding(toLength: 20, withPad: " ", startingAt: 0)
        let lineNum = "\(line)".padding(toLength: 4, withPad: " ", startingAt: 0)
        let flag = flags[level]?.padding(toLength: 20, withPad: " ", startingAt: 0) ?? ""
        return "\(flag) \(funcString)\(fileName):\(lineNum)"
    }

    static func i(_ msg: String, fileStr: String = #file, funcStr: String = #function, line: Int = #line) {
        if logLevel.contains("i") {
            if #available(iOS 14.0, *) {
                Logger(subsystem: subsystem, category: setup(fileStr, funcStr, line, "i")).info("\(msg)")
            } else {
                print("\(setup(fileStr, funcStr, line, "i")) : \(msg)")

            }
        }
    }
    static func e(_ msg: String, fileStr: String = #file, funcStr: String = #function, line: Int = #line) {
        if logLevel.contains("e") {
            if #available(iOS 14.0, *) {
                Logger(subsystem: subsystem, category: setup(fileStr, funcStr, line, "e")).error("\(msg)")
            } else {
                print("\(setup(fileStr, funcStr, line, "e")) : \(msg)")

            }
        }
    }
    static func d(_ msg: String, fileStr: String = #file, funcStr: String = #function, line: Int = #line) {
        if logLevel.contains("d") {
            if #available(iOS 14.0, *) {
                Logger(subsystem: subsystem, category: setup(fileStr, funcStr, line, "d")).debug("\(msg)")
            } else {
                print("\(setup(fileStr, funcStr, line, "d")) : \(msg)")

            }
        }
    }
    static func w(_ msg: String, fileStr: String = #file, funcStr: String = #function, line: Int = #line) {
        if logLevel.contains("w") {
            if #available(iOS 14.0, *) {
                Logger(subsystem: subsystem, category: setup(fileStr, funcStr, line, "w")).warning("\(msg)")
            } else {
                print("\(setup(fileStr, funcStr, line, "w")) : \(msg)")

            }
        }
    }
    static func v(_ msg: String, fileStr: String = #file, funcStr: String = #function, line: Int = #line) {
        if logLevel.contains("v") {
            if #available(iOS 14.0, *) {
                Logger(subsystem: subsystem, category: setup(fileStr, funcStr, line, "v")).log("\(msg)")
            } else {
                print("\(setup(fileStr, funcStr, line, "v")) : \(msg)")
            }
        }
    }
}
