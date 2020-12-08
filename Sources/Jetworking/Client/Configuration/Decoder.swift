import Foundation

public protocol Decoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}
