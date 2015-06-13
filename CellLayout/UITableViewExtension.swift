//
//  Created by Nick Snyder on 6/12/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

extension UITableView {
  public override func layoutMarginsDidChange() {
    super.layoutMarginsDidChange()
    if UIDevice.hasMajorSystemVersion(8) {
      // on iPad iOS 8.x if default layout margins are used (8, 8, 8, 8) the horizontal layout margin components
      // get 7px added to each side AFTER the table cell heights are calculated.
      //
      // This is a problem because the cell layout has less width than it expected (14px to be exact)
      // so its actual height may be greater than the table view thinks it will be.
      //
      // Any time the layout margins change, we have to force a layout.
      // This bug is fixed in iOS 9 (as of WWDC 2015 Xcode 7 beta build 7a120f).
      NSLog("performing manual layout after layoutMargins changed")
      layoutIfNeeded()
    }
  }
}
