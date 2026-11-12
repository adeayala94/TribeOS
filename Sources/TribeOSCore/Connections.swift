/// The job a connection does for TribeOS.
public enum Role: String, Sendable, CaseIterable {
    case rails
    case governance
    case pipes
}

/// The only systems TribeOS connects to, all of them by way of Snowflake. The list is closed on purpose:
/// adding a connection means changing the README first, then this enum.
public enum Connection: String, Sendable, CaseIterable {
    case snowflake
    case cisco
    case redHat
    case ibm

    public var name: String {
        switch self {
        case .snowflake: "Snowflake"
        case .cisco: "Cisco"
        case .redHat: "Red Hat"
        case .ibm: "IBM"
        }
    }

    public var role: Role {
        switch self {
        case .snowflake: .rails
        case .cisco: .governance
        case .redHat, .ibm: .pipes
        }
    }

    /// TribeOS speaks to Snowflake directly, through one SDK. Every other
    /// connection is reached through Snowflake, never on its own.
    public var reachedThrough: Connection? {
        self == .snowflake ? nil : .snowflake
    }

    public static func serving(_ role: Role) -> [Connection] {
        allCases.filter { $0.role == role }
    }
}
