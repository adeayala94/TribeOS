/// The job a connection does for TribeOS.
public enum Role: String, Sendable, CaseIterable {
    case rails
    case governance
    case pipes
}

/// The only systems TribeOS connects to. The list is closed on purpose:
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

    public static func serving(_ role: Role) -> [Connection] {
        allCases.filter { $0.role == role }
    }
}
