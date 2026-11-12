import Testing
@testable import TribeOSCore

@Test("Every foundation package passes its live check", arguments: TribeOSFoundation.checks.map(\.package))
func foundationPackageWorks(package: String) async throws {
    let check = try #require(TribeOSFoundation.checks.first { $0.package == package })
    let detail = try await check.run()
    #expect(!detail.isEmpty)
}

@Test("The foundation covers the ten library packages exactly once")
func foundationIsComplete() {
    let packages = TribeOSFoundation.checks.map(\.package)
    #expect(packages.count == 10)
    #expect(Set(packages).count == packages.count)
}

@Test("TribeOS connects to exactly four systems in three roles")
func connectionsAreClosed() {
    #expect(Connection.allCases.map(\.name) == ["Snowflake", "Cisco", "Red Hat", "IBM"])
    #expect(Connection.serving(.rails) == [.snowflake])
    #expect(Connection.serving(.governance) == [.cisco])
    #expect(Connection.serving(.pipes) == [.redHat, .ibm])
}

#if !os(macOS)
@Test("AppleScript refuses to run off macOS")
func appleScriptNeedsMacOS() {
    #expect(throws: AppleScript.Failure.self) {
        try AppleScript.run(source: "return 1")
    }
}
#else
@Test("AppleScript runs on macOS")
func appleScriptRuns() throws {
    #expect(try AppleScript.run(source: "return 1 + 1") == "2")
}
#endif
