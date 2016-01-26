//
//  ViewController.swift
//  DateExtensions
//
//  Created by aybek can kaya on 17/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testDate()
    }

    func testDate()
    {
        let now = NSDate()
        
       now.minute()
        
       let dayIndex = now.dayIndexInWeek()
        
        
        // operators 
        var dateComponents = DateComponent(day: 0, hour: 1, minute: 0, second: 0)
        
        let sum = now + dateComponents
       
        
        let sumInverse = dateComponents + now
        
        
        // Sub 
        let sub = now - dateComponents
        
        var components = DateComponent()
        components.day = 1
        components.hour = 3
        
        
        
        
        let pastDate = now - components
        let futureDate = now + components
        
        let subSeconds = futureDate - pastDate
        
        
        // compare 
        if(futureDate > pastDate)
        {
            print("newer")
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

