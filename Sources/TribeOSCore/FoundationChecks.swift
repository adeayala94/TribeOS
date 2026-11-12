import Algorithms
import AsyncAlgorithms
import Atomics
import Collections
import Crypto
import Foundation
import NIOCore
import NIOPosix
import Numerics
import SwiftASN1
import SystemPackage
import X509

/// One live check proving a foundation package is linked and working.
public struct FoundationCheck: Sendable {
    public let package: String
    public let run: @Sendable () async throws -> String

    public init(package: String, run: @escaping @Sendable () async throws -> String) {
        self.package = package
        self.run = run
    }
}

public struct FoundationCheckFailure: Error, CustomStringConvertible {
    public let description: String
}

private func expect(_ condition: Bool, _ message: String) throws {
    if !condition { throw FoundationCheckFailure(description: message) }
}

public enum TribeOSFoundation {
    public static let version = "0.1.0"

    /// Every package the foundation is built on, each exercised with a real call.
    /// `swift-argument-parser` is exercised by the `tribeos` command itself.
    public static let checks: [FoundationCheck] = [
        FoundationCheck(package: "swift-algorithms") {
            let chunks = Array((1...6).chunks(ofCount: 2))
            try expect(chunks.count == 3, "expected 3 chunks, got \(chunks.count)")
            return "chunked 1...6 into \(chunks.count) pairs"
        },
        FoundationCheck(package: "swift-asn1") {
            let oid: ASN1ObjectIdentifier = [1, 2, 840, 113549]
            var serializer = DER.Serializer()
            try serializer.serialize(oid)
            let decoded = try ASN1ObjectIdentifier(derEncoded: serializer.serializedBytes)
            try expect(decoded == oid, "DER round trip changed the identifier")
            return "DER round trip of \(oid)"
        },
        FoundationCheck(package: "swift-async-algorithms") {
            var total = 0
            for await (a, b) in zip([1, 2, 3].async, [10, 20, 30].async) {
                total += a + b
            }
            try expect(total == 66, "expected 66, got \(total)")
            return "zipped two async sequences, sum \(total)"
        },
        FoundationCheck(package: "swift-atomics") {
            let counter = ManagedAtomic<Int>(0)
            await withTaskGroup(of: Void.self) { group in
                for _ in 0..<100 {
                    group.addTask { counter.wrappingIncrement(ordering: .relaxed) }
                }
            }
            let value = counter.load(ordering: .relaxed)
            try expect(value == 100, "expected 100, got \(value)")
            return "100 concurrent increments, counter \(value)"
        },
        FoundationCheck(package: "swift-certificates") {
            let name = try DistinguishedName { CommonName("TribeOS") }
            try expect(name.description.contains("TribeOS"), "unexpected name \(name)")
            return "built distinguished name \(name)"
        },
        FoundationCheck(package: "swift-collections") {
            var deque: Deque = [2, 3]
            deque.prepend(1)
            let ordered = OrderedSet([3, 1, 3, 2])
            try expect(Array(deque) == [1, 2, 3], "deque order wrong")
            try expect(Array(ordered) == [3, 1, 2], "ordered set order wrong")
            return "Deque \(Array(deque)), OrderedSet \(Array(ordered))"
        },
        FoundationCheck(package: "swift-crypto") {
            let digest = SHA256.hash(data: Data("TribeOS".utf8))
            let hex = digest.map { String(format: "%02x", $0) }.joined()
            try expect(hex.count == 64, "digest length wrong")
            return "SHA-256 \(hex.prefix(12))…"
        },
        FoundationCheck(package: "swift-nio") {
            let loop = MultiThreadedEventLoopGroup.singleton.any()
            let answer = try await loop.submit { 6 * 7 }.get()
            try expect(answer == 42, "expected 42, got \(answer)")
            return "event loop returned \(answer)"
        },
        FoundationCheck(package: "swift-numerics") {
            let i = Complex<Double>.i
            let squared = i * i
            try expect(squared.real == -1 && squared.imaginary == 0, "i² was \(squared)")
            return "i² = \(Int(squared.real))"
        },
        FoundationCheck(package: "swift-system") {
            let path = FilePath("/usr/local").appending("bin").appending("tribeos")
            try expect(path.lastComponent?.string == "tribeos", "path was \(path)")
            return "composed path \(path)"
        },
    ]
}
