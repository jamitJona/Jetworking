import Foundation

/// The decoding decides which decoder  is used to process data to a decodable value.
/// - `json` uses the built in JSONDecoder to decode data.
/// - `custom` uses the associated decoder of this case to decode data. You can use this case to inject a custom decoder.
public enum Decoding: Decoder {
    case json
    case custom(Decoder)

    /**
     * Decodes data to the given type.
     *
     * - Parameter type:
     *  The type data is decoded to.
     * - Parameter data:
     *  The input data which is decoded to type
     */
    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        switch self {
        case .json:
            return try JSONDecoder().decode(type, from: data)

        case let .custom(decoder):
            return try decoder.decode(type, from: data)
        }
    }
}
