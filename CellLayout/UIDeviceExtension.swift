//
//  Created by Nick Snyder on 6/12/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

extension UIDevice {
  class func hasMinimumSystemVersion(version: String) -> Bool {
    let deviceSystemVersion = UIDevice.currentDevice().systemVersion
    let compareResult = deviceSystemVersion.compare(version, options: .NumericSearch)
    return compareResult == .OrderedSame || compareResult == .OrderedDescending
  }
}