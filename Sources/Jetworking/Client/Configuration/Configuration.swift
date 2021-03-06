import Foundation

/// The configuration used within the client.
public struct Configuration {
    let baseURL: URL
    let interceptors: [Interceptor]
    let encoder: JSONEncoder
    let decoder: JSONDecoder
    let requestExecutorType: RequestExecutorType
    let downloadExecutorType: DownloadExecutorType
    let uploadExecutorType: UploadExecutorType
    let responseQueue: DispatchQueue

    /// RequestInteceptors stored in `interceptors` property
    public var requestInterceptors: [RequestInterceptor] {
        interceptors.compactMap { $0 as? RequestInterceptor }
    }

    /// ResponseInteceptors stored in `interceptors` property
    public var responseInterceptors: [ResponseInterceptor] {
        interceptors.compactMap { $0 as? ResponseInterceptor }
    }

    /**
     * Initialises a new configuration instance to use within the client.
     *
     * - Parameter baseURL: The base URL used within the client.
     * - Parameter interceptors: A list of interceptors to intercept the request before sending (`RequestInterceptor`) it or intersect the response after receiving it (`ResponseInterceptor`).
     * - Parameter encoder: The encoder to use to encode the request body data before sending it.
     * - Parameter decoder: The decoder to use to decode the response body data before returning it.
     * - Parameter requestExecutorType: The request executor type to use to execute the requests.
     * - Parameter downloadExecutorType: The download executor type to use to execute downloads.
     * - Parameter uploadExecutorType: The upload executor type to use to execute uploads
     */
    public init(
        baseURL: URL,
        interceptors: [Interceptor],
        encoder: JSONEncoder,
        decoder: JSONDecoder,
        requestExecutorType: RequestExecutorType = .async,
        downloadExecutorType: DownloadExecutorType = .default,
        uploadExecutorType: UploadExecutorType = .default,
        responseQueue: DispatchQueue = .main
    ) {
        self.baseURL = baseURL
        self.interceptors = interceptors
        self.encoder = encoder
        self.decoder = decoder
        self.requestExecutorType = requestExecutorType
        self.downloadExecutorType = downloadExecutorType
        self.uploadExecutorType = uploadExecutorType
        self.responseQueue = responseQueue
    }
}
