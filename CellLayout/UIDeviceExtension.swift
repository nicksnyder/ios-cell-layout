//
//  Created by Nick Snyder on 6/12/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

extension UIDevice {
  class func hasMinimumSystemVersion(version: String) -> Bool {
    let systemVersion = UIDevice.currentDevice().systemVersion
    let compareResult = systemVersion.compare(version, options: .NumericSearch)
    return compareResult == .OrderedSame || compareResult == .OrderedDescending
  }
  
  class func hasMajorSystemVersion(version: Int) -> Bool {
    let systemVersion = UIDevice.currentDevice().systemVersion
    if let majorVersion = systemVersion.substringToIndex(advance(systemVersion.startIndex, 1)).toInt() {
      return version == majorVersion
    }
    return false
  }
}