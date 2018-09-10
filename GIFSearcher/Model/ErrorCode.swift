//
//  ErrorCode.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation


/// An enum representing different error conditions that the GiphyAPIClient.swift.
///
/// - noDataInRespone: The URLSessionTask called the handler block with no data.
/// - failedToUnwrapJSONFromDataResponse: The data wasn't able to be understood by `NSJSONSerialization`.
public enum ErrorCode: Int
{
    case noDataInResponse
    case failedToUnwrapJSONFromDataResponse
    case failedToProcessGIF
    case couldNotGenerateEndpoint
}

