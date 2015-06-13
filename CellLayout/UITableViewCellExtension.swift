//
//  Created by Nick Snyder on 6/12/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

extension UITableViewCell {
  
  // This method only needs to be used on iOS 7.
  // On iOS 8+ use automatic row heights.
  func heightInTableView(tableView: UITableView) -> CGFloat {
    let width = tableView.bounds.width
    
    // Give the cell the correct width and perform a layout pass.
    // The layout pass will give UILabels the correct width.
    // Since we have subclassed UILabel, the preferredMaxLayoutWith will get set during the layout pass.
    bounds = CGRect(origin: CGPointZero, size: CGSize(width: width, height: 0))
    setNeedsLayout()
    layoutIfNeeded()
    
    // Now that our Labels have the correct preferredMaxLayoutWidth, we can run autolayout to get the correct size.
    let size = contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
    
    // The separator height isn't included in the size of the content view so we have to account for that here.
    let separatorHeightAdjustment: CGFloat = tableView.separatorStyle == .None ? 0 : 0.5
    return size.height + separatorHeightAdjustment
  }
}
