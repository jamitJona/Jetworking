import Foundation

public struct Endpoint<ResponseType: Decodable> {
    var pathComponent: String
    var queryParameters: [String: String?] = [:]

    /**
     * # Summary
     * Adding a dictionary of query parameters to the endpoint.
     *
     * - Parameter parameters:
     *  A dictionary containting the query parameters in form [Key: Value]. If the key already
     *  exists it will be overriden
     *
     * - Returns:
     * A new endpoint instance with the merged parameters.
     */
    func addQueryParameters(_ parameters: [String: String?]) -> Endpoint<ResponseType> {
        var endpoint = self

        endpoint.queryParameters = endpoint.queryParameters.merging(
            parameters,
            uniquingKeysWith: { _, rhsKey in rhsKey }
        )

        return endpoint
    }

    /**
     * # Summary
     * Adding a query parameter to the endpoint.
     *
     * - parameter key: The key of the query parameter to add. If the key is already present, its value will be overriden by the new one.
     * - parameter value: The value of the query parameter.
     *
     * - Returns:
     * A new endpoint instance with the added parameter.
     */
    func addQueryParameter(key: String, value: String?) -> Endpoint<ResponseType> {
        return addQueryParameters([key: value])
    }
}
