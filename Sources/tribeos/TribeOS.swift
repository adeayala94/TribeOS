import ArgumentParser
import Foundation
import TribeOSCore

@main
struct TribeOS: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "tribeos",
        abstract: "The TribeOS foundation, in the terminal.",
        version: TribeOSFoundation.version,
        subcommands: [Doctor.self, Script.self],
        defaultSubcommand: Doctor.self
    )
}

struct Doctor: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Check that every foundation package is linked and working."
    )

    func run() async throws {
        var rows: [(ok: Bool, package: String, detail: String)] = [
            (true, "swift-argument-parser", "parsed this command"),
        ]
        for check in TribeOSFoundation.checks {
            do {
                rows.append((true, check.package, try await check.run()))
            } catch {
                rows.append((false, check.package, "\(error)"))
            }
        }
        rows.sort { $0.package < $1.package }

        let failures = rows.filter { !$0.ok }.count
        let summary = failures == 0
            ? "\(rows.count) of \(rows.count) packages in order"
            : "\(failures) of \(rows.count) packages out of order"
        let width = rows.map(\.package.count).max() ?? 0
        let lines = rows.map { row in
            "\(row.ok ? "●" : "○") \(row.package.padding(toLength: width, withPad: " ", startingAt: 0))  \(row.detail)"
        }
        print(Panel.render(title: "TribeOS \(TribeOSFoundation.version)", lines: lines, footer: summary))
        if failures > 0 { throw ExitCode.failure }
    }
}

struct Script: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Run an AppleScript file (macOS only)."
    )

    @Argument(help: "Path to an .applescript or .scpt file.")
    var path: String

    func run() throws {
        let output = try AppleScript.run(file: URL(fileURLWithPath: path))
        if !output.isEmpty { print(output) }
    }
}

/// Terminal output in the house style: rounded corners, weight off-centre.
enum Panel {
    static func render(title: String, lines: [String], footer: String) -> String {
        let inner = max(lines.map(\.count).max() ?? 0, title.count + 6, footer.count + 6) + 2
        func rule(_ left: String, _ label: String, _ right: String, labelAtEnd: Bool) -> String {
            let tag = " \(label) "
            let fill = String(repeating: "─", count: inner - tag.count - 1)
            return labelAtEnd ? "\(left)\(fill)\(tag)─\(right)" : "\(left)─\(tag)\(fill)\(right)"
        }
        var out = [rule("╭", title, "╮", labelAtEnd: false)]
        for line in lines {
            out.append("│ \(line.padding(toLength: inner - 1, withPad: " ", startingAt: 0))│")
        }
        out.append(rule("╰", footer, "╯", labelAtEnd: true))
        return out.joined(separator: "\n")
    }
}
