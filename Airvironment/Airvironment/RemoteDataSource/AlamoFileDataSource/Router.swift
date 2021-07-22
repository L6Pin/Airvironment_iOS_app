import Foundation
import Alamofire

struct Router {
    
    public static var baseUrl: URL = URL(string: "https://airvironment.live")!
    
    enum Air: URLRequestConvertible {
        case getAll
        case getLatest
        
        var resource: String {
            switch self {
            case .getAll: return "/api/measurements"
            case .getLatest: return "/api/measurements/latest"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getAll: return .get
            case .getLatest: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getAll: return resource
            case let .getLatest: return resource
            }
        }
        
        
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request.method = method

            switch self {
            case .getAll, .getLatest:
                break
            }
            
            return request
        }
        
    }
        
}
