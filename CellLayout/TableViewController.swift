//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  static let singleLine = "Single line Single line"
  static let doubleLine = "Double line Double line Double line Double line ggggg"
  static let trippleLine = "overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow overflow "
  
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
    //tableView.estimatedRowHeight = 50 // Not necessary, but iOS 8 seems to do FIVE(!) layout passes without it
    tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
  }
  
  var cellHeights: [Int: CGFloat] = [:]
  
  private func verifyCellHeight(height: CGFloat, indexPath: NSIndexPath) {
    // Ensure that heights of cells never change.
    if let expectedHeight = cellHeights[indexPath.item] {
      assert(height == expectedHeight, "cell \(indexPath.item) was \(expectedHeight) now \(height)")
    } else {
      cellHeights[indexPath.item] = height
    }
  }
}

extension TableViewController: UITableViewDelegate {
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let content = contents[indexPath.item]
    let height = ContentTableCell.sharedCell.bind(content).heightForWidth(tableView.bounds.width)
    NSLog("heightForRowAtIndexPath \(indexPath.item) height \(height)")
    verifyCellHeight(height, indexPath: indexPath)
    return height
  }
  
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    //NSLog("willDisplayCell \(indexPath.item) \(cell.bounds)")
    verifyCellHeight(cell.bounds.height, indexPath: indexPath)
  }

  override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    //NSLog("didEndDisplayingCell \(indexPath.item) \(cell.bounds)")
    verifyCellHeight(cell.bounds.height, indexPath: indexPath)
  }
}

extension TableViewController: UITableViewDataSource {
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    NSLog("numberOfRowsInSection \(section)")
    return contents.count;
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    NSLog("cellForRowAtIndexPath \(indexPath.item)")
    let content = contents[indexPath.item]
    let cell = ContentTableCell.dequeueForTableView(tableView, indexPath: indexPath)
    cell.bind(content)
    return cell
  }
}

struct Content {
  let title: String
  let body: String
}