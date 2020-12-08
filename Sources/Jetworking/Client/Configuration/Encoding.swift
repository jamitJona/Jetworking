import Foundation

public enum Encoding: Encoder {
    case json
    case custom(Encoder)

    public func encode<T>(_ value: T) throws -> Data where T : Encodable {
        switch self {
        case .json:
            return try JSONEncoder().encode(value)

        case let .custom(encoder):
            return try encoder.encode(value)
        }
    }
}
