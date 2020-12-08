import Foundation

/// The encoding decides which encoder is used to encode encodable values to data.
/// - `json` uses the built in JSONEnoder to encode encodable values.
/// - `custom` uses the associated encoder of this case to encode encodable values. You can use this case to inject a custom encoder.
public enum Encoding: Encoder {
    case json
    case custom(Encoder)

    /**
     * Encodes encodable values to data.
     *
     * - Parameter value:
     *  The encodable value to be encoded to data.
     * - Parameter data:
     *  The input data which is decoded to type
     */
    public func encode<T>(_ value: T) throws -> Data where T : Encodable {
        switch self {
        case .json:
            return try JSONEncoder().encode(value)

        case let .custom(encoder):
            return try encoder.encode(value)
        }
    }
}
