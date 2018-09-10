//
//  RenditionFileType+Keys.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

// MARK: - Adding Keys to Access Rendition Files

extension RenditionFileType
{
    /// The key to access the size
    /// of the file matching this file type.
    var sizeKey: String
    {
        switch self
        {
        case .gif:
            return "size"
        case .mp4:
            return "mp4_size"
        case .webp:
            return "webp_size"
        }
    }
    
    var urlKey: String
    {
        switch self {
        case .gif:
            return "url"
        case .mp4:
            return "mp4"
        case .webp:
            return "webp"
        }
    }
}
