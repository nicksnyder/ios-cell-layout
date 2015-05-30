//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class Label: UILabel {
  override func layoutSubviews() {
    updatePreferredMaxLayoutWidth()
    super.layoutSubviews()
  }
  
  private func updatePreferredMaxLayoutWidth() {
    if (preferredMaxLayoutWidth != bounds.width) {
      NSLog("updating preferredMaxLayoutWidth from \(preferredMaxLayoutWidth) to \(bounds.width)")
      preferredMaxLayoutWidth = bounds.width
    }
  }
}
