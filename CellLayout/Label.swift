//
//  Created by Nick Snyder on 6/12/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

/// Label updates preferredMaxLayoutWidth any time its bounds or frame changes.
/// You do not need to use Label if you are targeting iOS 8+ (use UILabel instead).
///
/// If you are creating a Label or UILabel in a .xib, make sure to
/// leave the explicit preferred width box UNCHECKED no matter what platforms you are targeting.
/// This will cause a warning if you are targeting iOS 7, but that is fine because in that case
/// you should be using this Label class which manages the preferredMaxLayoutWidth for you.
///
/// I tried putting this logic in a UILabel extension, but it didn't work (unsure why).
class Label: UILabel {
  
  override var bounds: CGRect {
    didSet {
      updatePreferredMaxLayoutWidth()
    }
  }
  
  override var frame: CGRect {
    didSet {
      updatePreferredMaxLayoutWidth()
    }
  }
  
  private func updatePreferredMaxLayoutWidth() {
    // Rely on automatic preferred max layout with in iOS 8+
    if (preferredMaxLayoutWidth != bounds.width && !UIDevice.hasMinimumSystemVersion("8.0")) {
      NSLog("updating preferredMaxLayoutWidth from \(preferredMaxLayoutWidth) to \(bounds.width)")
      preferredMaxLayoutWidth = bounds.width
    }
  }
}
