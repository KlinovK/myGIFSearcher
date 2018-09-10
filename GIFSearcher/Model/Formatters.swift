//
//  Formatters.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

// We create a single instance of the formatters we need,
// since creating them is relatively expensive (in terms of time.)
internal let dateFormatter = DateFormatter()
internal let numberFormatter = NumberFormatter()
