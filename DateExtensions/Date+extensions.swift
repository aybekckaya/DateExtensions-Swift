//
//  Date+extensions.swift
//  DateExtensions
//
//  Created by aybek can kaya on 17/01/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import Foundation


struct DateComponent
{
    var day:Int=0
    var hour:Int=0
    var minute:Int=0
    var second:Int=0
    
    init()
    {
        
    }
    
    init(day theDay:Int , hour theHour:Int , minute theMinute:Int , second theSecond:Int)
    {
        self.day = theDay
        self.hour = theHour
        self.minute = theMinute
        self.second = theSecond
    }
    
    
    func seconds()->Int
    {
            return self.second + self.minute*60 + self.hour*60*60 + self.day*60*60*24
    }
    
    
}

extension NSDate
{
    
    func toInteger()->Int
    {
        let intValue:Int = Int(self.timeIntervalSince1970)
        return intValue
    }
    
    static func dateFromInteger(timeInterval interval:Int) ->NSDate
    {
        let dateVal = NSDate(timeIntervalSince1970: Double(interval))
        return dateVal
    }
    

    static func now()->NSDate
    {
        let date = NSDate()
        return date
    }
    
    // Getting date Components
    
    private func dateComponents()->NSDateComponents
    {
        //(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
        
        let calendar:NSCalendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components([ .Year, .Month, .Day, .Hour , .Minute ,.Second , .Weekday]  , fromDate: self)
        
        return dateComponents
    }
    
    
    func year()->Int
    {
        let components:NSDateComponents = self.dateComponents()
        
        return components.year
    }
    
    
    func month()->Int
    {
        return self.dateComponents().month
    }
    
    
    func day()->Int
    {
        return self.dateComponents().day
    }
    
    func hour()->Int
    {
        return self.dateComponents().hour
    }
    
    
    func minute()->Int
    {
        return self.dateComponents().minute
    }
    
    func second()->Int
    {
        return self.dateComponents().second
    }
    
    
    func miliseconds()->Int64
    {
        return Int64(self.timeIntervalSince1970*1000)
    }
    
    
    // Day Index 
    
    func dayIndexInWeek()->Int
    {
        return self.dateComponents().weekday
    }
    
    
    
    
}

/// Operator overloads

func +(left:DateComponent , right:NSDate)->NSDate
{
    let dateInteger = right.toInteger()
    let componentSeconds = left.seconds()
    
    let sum = dateInteger + componentSeconds
    
    let dateNew = NSDate.dateFromInteger(timeInterval: sum)
    
    return dateNew
}

func +(left:NSDate , right:DateComponent)->NSDate
{
    return right+left
}



func -(left:NSDate , right:DateComponent)->NSDate
{
    let dateInteger = left.toInteger()
    let componentSeconds = right.seconds()
    
    let sub = dateInteger - componentSeconds
    
    return NSDate.dateFromInteger(timeInterval: sub)
}


func -(left:NSDate , right:NSDate)->Int
{
    let dateIntLeft = left.toInteger()
    let dateIntRight = right.toInteger()
    
    let sub = dateIntLeft-dateIntRight
    
    return sub
}



func >(left:NSDate , right:NSDate)->Bool
{
    let dateIntLeft = left.toInteger()
    let dateIntRight = right.toInteger()
    
    return dateIntLeft > dateIntRight
}


func >=(left:NSDate , right:NSDate)->Bool
{
    let dateIntLeft = left.toInteger()
    let dateIntRight = right.toInteger()
    
    return dateIntLeft >= dateIntRight
}


func <(left:NSDate , right:NSDate)->Bool
{
    let dateIntLeft = left.toInteger()
    let dateIntRight = right.toInteger()
    
    return dateIntLeft < dateIntRight
}


func ==(left:NSDate , right:NSDate)->Bool
{
    let dateIntLeft = left.toInteger()
    let dateIntRight = right.toInteger()
    
    return dateIntLeft == dateIntRight
}

func <=(left:NSDate , right:NSDate)->Bool
{
    let dateIntLeft = left.toInteger()
    let dateIntRight = right.toInteger()
    
    return dateIntLeft <= dateIntRight
}


