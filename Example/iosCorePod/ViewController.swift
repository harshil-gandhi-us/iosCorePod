//
//  ViewController.swift
//  iosCorePod
//
//  Created by 164989979 on 08/06/2024.
//  Copyright (c) 2024 164989979. All rights reserved.
//

import UIKit
import iosCorePod

class ViewController: UIViewController {
    let appUpdateManager = AppsOnAirCoreServices()
    override func viewDidLoad() {
        super.viewDidLoad()
         let appId = appUpdateManager.getAppId()
        
        print("App Id: \(appId)")
        appUpdateManager.initialize()
        appUpdateManager.networkStatusListenerHandler { Connected in
            print("isConnect \(Connected)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

