//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class ContentTableCell: UITableViewCell {
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var bodyLabel: UILabel!
  
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
  
  func heightForWidth(width: CGFloat) -> CGFloat {
    bounds = CGRect(origin: CGPointZero, size: CGSize(width: width, height: 0))
    setNeedsLayout()
    layoutIfNeeded()
    let size = contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
    //NSLog("END width \(size.width)")
    return size.height
  }
}
