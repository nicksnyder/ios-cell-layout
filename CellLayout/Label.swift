//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class Label: UILabel {
  override var bounds: CGRect {
    willSet {
      //preferredMaxLayoutWidth = newValue.width
    }
    didSet {
      updatePreferredMaxLayoutWidth()
      //setNeedsUpdateConstraints()
    }
  }
  
  override func updateConstraints() {
    //updatePreferredMaxLayoutWidth()
    super.updateConstraints()
  }
  
  private func updatePreferredMaxLayoutWidth() {
    if (preferredMaxLayoutWidth != bounds.width) {
      NSLog("updating preferredMaxLayoutWidth from \(preferredMaxLayoutWidth) to \(bounds.width)")
      preferredMaxLayoutWidth = bounds.width
    }
  }
  /*
  override func layoutSubviews() {
    self.preferredMaxLayoutWidth = self.bounds.width
    super.layoutSubviews()
  }*/
}
