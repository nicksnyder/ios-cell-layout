//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class ContentTableCell: UITableViewCell {
  @IBOutlet private var titleLabel: Label!
  @IBOutlet private var bodyLabel: Label!
  
  private static let nibName = "ContentTableCell"
  
  static let sharedCell: ContentTableCell = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil).first as! ContentTableCell
  
  class func registerForTableView(tableView: UITableView) {
    tableView.registerNib(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
  }
  
  class func dequeueForTableView(tableView: UITableView, indexPath: NSIndexPath) -> ContentTableCell {
    return tableView.dequeueReusableCellWithIdentifier(nibName, forIndexPath: indexPath) as! ContentTableCell
  }
  
  func bind(content: Content) -> Self {
    titleLabel.text = content.title
    bodyLabel.text = content.body
    return self
  }
  
  func heightInTableView(tableView: UITableView) -> CGFloat {
    // on iPad iOS 8.x we observed that if default layout margins are used (8, 8, 8, 8) the horizontal layout margin components get 7px added to each side AFTER the table heights are calculated
    // BUT the table view does not get reloaded so the actual cell hight can end up being different than the computed cell height.
    // The easiest thing to do is to force non-default layout margins so they don't unexpectedly change (assuming a developer never needs to change layout margins dynamically).
    // A more correct solution probably involves subclassing UITableView or UIView and overriding layoutMarginsDidChange setNeedsLayout or something.
    // It seems like a change in layout margins should cause layout to happen so maybe this is a bug in UIKit.
    tableView.layoutMargins = UIEdgeInsetsZero
    
    let width = tableView.bounds.width
    bounds = CGRect(origin: CGPointZero, size: CGSize(width: width, height: 0))
    setNeedsLayout()
    layoutIfNeeded()
    let size = contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
    //NSLog("END width \(size.width)")
    return size.height
  }
}
