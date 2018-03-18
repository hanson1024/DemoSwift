//
//  HCDateModelService.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/14.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCDateModelService: NSObject {
    
    private var maxDateCount = 60
    private var saleDateCount = 30
    
    private var salefinded = false
    
    private var dateList = [HCDateModel]()
    
    private let currentDate = Date()
    private let formatter = DateFormatter()
    
    private let dateWeekArray = ["周日","周一","周二","周三","周四","周五","周六"]
    
    
    func getDateList(maxDateCount: Int,saleDateCount: Int) -> [HCDateModel] {
        
        if maxDateCount < saleDateCount {
            
            print("预售时间跟总时间有误")
            
            return []
        }
        
        self.maxDateCount = maxDateCount
        self.saleDateCount = saleDateCount
        
        var count = 0
        var currentDateComponents: DateComponents = dateInfo(date: currentDate)
        formatter.dateFormat = "yyyy-MM-dd" // 年-月-日
        formatter.timeZone = TimeZone.init(abbreviation: "Asia/Shanghai")
        
        while count < maxDateCount {
            
            if count == 0 {
                
                let totalDays = totalDaysThisMonth(date: currentDate)
                
                count = totalDays - currentDateComponents.day!
                
                for i in currentDateComponents.day!...totalDays{
                    
                    if let month = currentDateComponents.month, let year = currentDateComponents.year {
                        
                        addToDateList(year: year, month: month, i: i)
                        
                    }
                }
                
                count == 0 ? count = 1 : ()
                
            }else{
                
                
                var nextDate:Date?
                
                if currentDateComponents.month == 12 {
                    
                    let nextYear = currentDateComponents.year! + 1
                    
                    nextDate = formatter.date(from: "\(nextYear)-\(1)-\(1)")
                    
                }else{
                    
                    let year = currentDateComponents.year!
                    let nextMonth = currentDateComponents.month! + 1
                    
                    nextDate = formatter.date(from: "\(year)-\(nextMonth)-\(1)")
                }
                
                
                let nextDateComponents: DateComponents = dateInfo(date: nextDate!)
                
                let nextTotalDays = totalDaysThisMonth(date: nextDate!)
                
                if maxDateCount - count < nextTotalDays {
                    
                    for i in 1...maxDateCount - count{
                        
                        if let month = nextDateComponents.month, let year = nextDateComponents.year  {
                            
                            addToDateList(year: year, month: month, i: i)
                            
                        }
                    }
                    
                    count = maxDateCount
                    
                }else{
                    
                    for i in 1...nextTotalDays{
                        
                        if let month = nextDateComponents.month, let year = nextDateComponents.year  {
                            
                            addToDateList(year: year, month: month, i: i)
                            
                        }
                    }
                    count += nextTotalDays
                    
                }
                
                currentDateComponents = nextDateComponents
            }
            
            
        }
        
        return dateList
        
    }
    
    
    private func addToDateList(year: Int, month: Int, i: Int) -> Void {
        
        let dateModel = HCDateModel()
        dateModel.dateString = "\(String(describing: month))月" + "\(i)日"
        dateModel.dateUrlString = "\(String(describing: year))-" + "\(String(describing: month))-" + "\(i)"
        
        let newDate = formatter.date(from: "\(String(describing: year))-\(String(describing: month))-\(i)")
        
        if salefinded == false{
            findStarSaleDay(date: newDate!, model: dateModel)
        }
        
        dateModel.dateWeekString = weekDayThisDay(date: newDate!)
        
        dateList.append(dateModel)
    }
    
    private func dateInfo(date: Date) -> (DateComponents) {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day,Calendar.Component.weekday], from: date)
        
        return components
    }
    
    private func weekDayThisDay(date: Date) -> String {
        
        if NSCalendar.current.isDateInToday(date) {
            return "今天"
        }else if NSCalendar.current.isDateInTomorrow(date){
            return "明天"
        }else{
            let components = dateInfo(date: date)
            
            return dateWeekArray[components.weekday! - 1]
        }
        
    }
    
    private func findStarSaleDay(date: Date,model: HCDateModel) -> Void {
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.day]
        
        if let autoFormattedDifference = dateComponentsFormatter.string(from: currentDate, to: date) {
            
            let string: String = autoFormattedDifference.replacingOccurrences(of: "天", with: "")
            
            if let count = Int(string) {
                
                if count + 2 == saleDateCount {
                    
                    salefinded = true
                    model.showStarSale = true
                    
                    print(count + 1)
                }
            }
        }
        
    }
    
    
    private func totalDaysThisMonth(date: Date) -> (Int) {
        let totalDaysThisMonth:Range = Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)!
        return totalDaysThisMonth.count
    }

}
