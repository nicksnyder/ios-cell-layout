//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  static let singleLine = "Single line Single line"
  static let doubleLine = "Double line Double line Double line Double line ggggg"
  static let trippleLine = "overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow "
  //static let trippleLine = "overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow" // for testing iPad iOS 8
  
  let contents = [
    Content(title: singleLine, body: singleLine),
    Content(title: singleLine, body: doubleLine),
    Content(title: singleLine, body: trippleLine),
    
    Content(title: doubleLine, body: singleLine),
    Content(title: doubleLine, body: doubleLine),
    Content(title: doubleLine, body: trippleLine),

    Content(title: trippleLine, body: singleLine),
    Content(title: trippleLine, body: doubleLine),
    Content(title: trippleLine, body: trippleLine),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ContentTableCell.registerForTableView(tableView)
    tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
    
    // It is necessary to provide an estimated row height for automatic table cell sizing to work in iOS 8+
    tableView.estimatedRowHeight = 100
    
    // This isn't strictly necessary since this is the default value, but it is important to not specify a row height
    // for automatic sizing to work.
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  // MARK - UITableViewDelegate
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = tableView.cellForRowAtIndexPath(indexPath)
    NSLog("break here for debugging")
    // [view _autolayoutTrace]
    // hasAmbiguousLayout
    // exerciseAmbiguityInLayout
  }
  
  // MARK - UITableViewDataSource
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contents.count;
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    NSLog("cellForRowAtIndexPath \(indexPath.item)")
    let content = contents[indexPath.item]
    let cell = ContentTableCell.dequeueForTableView(tableView, indexPath: indexPath)
    cell.bind(content)
    if (!UIDevice.hasMinimumSystemVersion("9.0")) {
      // There is a bug in iOS 8 automatic cell height that causes layout to be incorrect in certain cases.
      cell.layoutIfNeeded()
    }
    return cell
  }
}

struct Content {
  let title: String
  let body: String
}