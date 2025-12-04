import Foundation

enum Profile: CaseIterable {
    case imageAvatar
    case shortData
    case smth
    
    var title: String {
        switch self {
            case .imageAvatar: return "Image of avatar"
            case .shortData: return "Biography"
            case .smth: return "Something"
        }
    }
}

enum Links {
    case imageUrl
    case shortDataUrl
    
    var url: URL {
        switch self {
        case Links.imageUrl: return URL(string: "https://")!
        case Links.shortDataUrl: return URL(string: "https://microsoftedge.github.io/Demos/json-dummy-data/64KB.json")!
        }
    }
}


