enum Profile: CaseIterable {
    case imageAvatar
    case shortData
    
    var title: String {
        switch self {
            case .imageAvatar: return "Image of avatar"
            case .shortData: return "Biography"
        }
    }
}

enum Links {
    case imageUrl
    case shortDataUrl
    
    var description: String {
        switch self {
        case Links.imageUrl: return "https://"
        case Links.shortDataUrl: return "https://"
        }
    }
}


