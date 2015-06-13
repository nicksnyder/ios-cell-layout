//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  static let oneLine = "one one one one one one one"
  static let twoLines = "two two two two two two two two two two two two two two"
  static let threeLines = "three three three three three three three three three three three three three three three"
  
  static let twoLinesIpad = "two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad two ipad"
  static let threeLinesIpad = "three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad three ipad"

  let contents = [
    
    // iPhone tests
    
    Content(title: oneLine, body: oneLine),
    Content(title: oneLine, body: twoLines),
    Content(title: oneLine, body: threeLines),
    
    Content(title: twoLines, body: oneLine),
    Content(title: twoLines, body: twoLines),
    Content(title: twoLines, body: threeLines),

    Content(title: threeLines, body: oneLine),
    Content(title: threeLines, body: twoLines),
    Content(title: threeLines, body: threeLines),
    
    // iPad tests
    
    Content(title: oneLine, body: oneLine),
    Content(title: oneLine, body: twoLinesIpad),
    Content(title: oneLine, body: threeLinesIpad),
    
    Content(title: twoLinesIpad, body: oneLine),
    Content(title: twoLinesIpad, body: twoLinesIpad),
    Content(title: twoLinesIpad, body: threeLinesIpad),
    
    Content(title: threeLinesIpad, body: oneLine),
    Content(title: threeLinesIpad, body: twoLinesIpad),
    Content(title: threeLinesIpad, body: threeLinesIpad), 
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ContentTableCell.registerForTableView(tableView)
    tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
    
    // It is necessary to provide an estimated row height for automatic table cell sizing to work in iOS 8+
    tableView.estimatedRowHeight = 100
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
    if (UIDevice.hasMajorSystemVersion(8)) {
      // There is a bug in iOS 8 automatic cell height that causes layout to be incorrect in certain cases.
      // This bug is fixed in iOS 9 (as of WWDC 2015 Xcode 7 beta build 7a120f).
      cell.layoutIfNeeded()
    }
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if (UIDevice.hasMinimumSystemVersion("8.0")) {
      return UITableViewAutomaticDimension
    }
    let content = contents[indexPath.item]
    let height = ContentTableCell.sharedCell.bind(content).heightInTableView(tableView)
    NSLog("heightForRowAtIndexPath \(indexPath.item) height \(height)")
    return height
  }
}

struct Content {
  let title: String
  let body: String
}