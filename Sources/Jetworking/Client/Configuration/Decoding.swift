import Foundation

public enum Decoding: Decoder {
    case json
    case custom(Decoder)

    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        switch self {
        case .json:
            return try JSONDecoder().decode(type, from: data)

        case let .custom(decoder):
            return try decoder.decode(type, from: data)
        }
    }
}
