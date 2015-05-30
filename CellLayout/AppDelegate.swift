//
//  Created by Nick Snyder on 5/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.backgroundColor = UIColor.redColor()
    self.window?.rootViewController = UINavigationController(rootViewController: TableViewController())
    self.window?.makeKeyAndVisible()
    return true
  }

}

