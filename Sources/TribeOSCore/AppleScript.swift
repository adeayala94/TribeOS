import Foundation

/// Runs AppleScript through the system `osascript` tool. macOS only.
public enum AppleScript {
    public enum Failure: Error, CustomStringConvertible {
        case unsupportedPlatform
        case scriptFailed(status: Int32, message: String)

        public var description: String {
            switch self {
            case .unsupportedPlatform:
                return "AppleScript only runs on macOS."
            case .scriptFailed(let status, let message):
                return "osascript exited with status \(status): \(message)"
            }
        }
    }

    /// Runs AppleScript source text and returns what it printed.
    public static func run(source: String) throws -> String {
        try osascript(["-e", source])
    }

    /// Runs an `.applescript` or `.scpt` file and returns what it printed.
    public static func run(file: URL) throws -> String {
        try osascript([file.path])
    }

    private static func osascript(_ arguments: [String]) throws -> String {
        #if os(macOS)
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = arguments
        let output = Pipe()
        let errors = Pipe()
        process.standardOutput = output
        process.standardError = errors
        try process.run()
        let outData = output.fileHandleForReading.readDataToEndOfFile()
        let errData = errors.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        let trim = { (data: Data) in
            String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        guard process.terminationStatus == 0 else {
            throw Failure.scriptFailed(status: process.terminationStatus, message: trim(errData))
        }
        return trim(outData)
        #else
        throw Failure.unsupportedPlatform
        #endif
    }
}
