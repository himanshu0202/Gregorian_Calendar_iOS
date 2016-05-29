 //
 //  ViewController.swift
 //  day calculator
 //
 //  Created by Himanshu Anand on 4/21/16.
 //  Copyright © 2016 Himanshu Anand. All rights reserved.
 //
 
 import UIKit
 
 class ViewController: UIViewController, UITextFieldDelegate {
    
    //: MARK: Instance variables
    
    @IBOutlet weak var startDay: UITextField!
    @IBOutlet weak var startMonth: UITextField!
    @IBOutlet weak var startYear: UITextField!
    @IBOutlet weak var endDay: UITextField!
    @IBOutlet weak var endMonth: UITextField!
    @IBOutlet weak var endYear: UITextField!
    @IBOutlet weak var daysBetween: UITextField!
    @IBOutlet weak var computeDays: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDay.delegate = self
        startMonth.delegate = self
        startYear.delegate = self
        endDay.delegate = self
        endMonth.delegate = self
        endYear.delegate = self
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return string == "" || Int(string) != nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        let startDateDay:Int? = Int(startDay.text!)
        let startDateMonth:Int? = Int(startMonth.text!)
        let startDateYear:Int? = Int(startYear.text!)
        let endDateDay:Int? = Int(endDay.text!)
        let endDateMonth:Int? = Int(endMonth.text!)
        let endDateYear:Int? = Int(endYear.text!)
        
        let DateObject = GregorianDate()
        
        if Int(startYear.text!) == nil || Int(startDay.text!) == nil || Int(startMonth.text!) == nil || Int(endDay.text!) == nil || Int(endMonth.text!) == nil || Int(endYear.text!) == nil {
            
            daysBetween.text = "Date , month and year fields cannot be empty"
        }
        else if Int(startYear.text!) <= 0 || Int(startDay.text!) <= 0 || Int(startMonth.text!) <= 0 || Int(endDay.text!) <= 0 || Int(endMonth.text!) <= 0 || Int(endYear.text!) <= 0 {
            
            daysBetween.text = "invalid input"
        }
        else
        {
            daysBetween.text = DateObject.differenceBetweenDates(startDateYear!,endDateYear: endDateYear!,startDateMonth: startDateMonth!,endDateMonth: endDateMonth!,startDateDay: startDateDay!,endDateDay: endDateDay!)
            
        }
    }
    
    
 }
 
 class GregorianDate{
    
    
    
    func differenceBetweenDates(startDateYear:Int,endDateYear:Int,startDateMonth:Int,endDateMonth:Int,startDateDay:Int,endDateDay:Int)->String{
        
        if(startDateYear > endDateYear){
            
            return "start year cannot be greater than end year"
            
            
        }else if(startDateYear == endDateYear){
            if(startDateMonth > endDateMonth){
                
                return "start Month cannot be greater than end Month"
                
                
            }else if(startDateMonth == endDateMonth){
                if (endDateDay < startDateDay) {
                    
                    return "end day cannot be less than start day"
                    
                }else{
                    switch startDateMonth {
                    case 1,3,5,7,8,10,12 :
                        if startDateDay < 1 || startDateDay  > 31 || endDateDay < 1 || endDateDay > 31 {
                            
                            return "please enter a date between 1 and 31"
                            
                            
                        }else{
                            
                            return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                            
                        }
                        
                    case 4,6,9,11 :
                        if (startDateDay < 1 || startDateDay > 30 || endDateDay < 1 || endDateDay > 30) {
                            
                            return "please enter a date between 1 and 30"
                            
                            
                        }else{
                            
                            return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                            
                        }
                        
                    case 2:
                        if isLeapYear(startDateYear) {
                            if (startDateDay < 1 || startDateDay > 29) {
                                
                                return "please enter start between 1 and 29"
                                
                                
                            }else{
                                
                                return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                                
                            }
                        }else{
                            if (startDateDay < 1 || startDateDay > 28) {
                                
                                return "please enter start date between 1 and 28"
                                
                                
                            }else{
                                
                                return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                                
                            }
                        }
                        
                        
                    default:
                        return "start month must be between 1 and 12"
                        
                        
                    }
                }
            }
            else{
                switch startDateMonth {
                case 1,3,5,7,8,10,12 :
                    if startDateDay < 1 || startDateDay  > 31 || endDateDay < 1 || endDateDay > 31 {
                        
                        return "please enter a date between 1 and 31"
                        
                        
                    }else{
                        
                        return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                        
                    }
                    
                case 4,6,9,11 :
                    if (startDateDay < 1 || startDateDay > 30 || endDateDay < 1 || endDateDay > 30) {
                        
                        return "please enter a date between 1 and 30"
                        
                        
                    }else{
                        
                        return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                        
                    }
                    
                case 2:
                    if isLeapYear(startDateYear) {
                        if (startDateDay < 1 || startDateDay > 29) {
                            
                            return "please enter start between 1 and 29"
                            
                            
                        }else{
                            
                            return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                            
                        }
                    }else{
                        if (startDateDay < 1 || startDateDay > 28) {
                            
                            return "please enter start date between 1 and 28"
                            
                            
                        }else{
                            
                            return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                            
                        }
                    }
                    
                    
                default:
                    return "start month must be between 1 and 12"
                    
                    
                }

            }
            
        }else{
            
            switch startDateMonth {
            case 1,3,5,7,8,10,12 :
                if (startDateDay < 1 || startDateDay  > 31) {
                    
                    return "please enter a date between 1 and 31"
                    
                    
                }else{
                    
                    return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                    
                }
                
            case 4,6,9,11 :
                if (startDateDay < 1 || startDateDay > 30) {
                    
                    return "please enter a date between 1 and 30"
                    
                    
                }else{
                    
                    return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                    
                }
                
            case 2:
                if isLeapYear(startDateYear) {
                    if (startDateDay < 1 || startDateDay > 29) {
                        
                        return "please enter start between 1 and 29"
                        
                        
                    }else{
                        
                        return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                        
                    }
                }else{
                    if (startDateDay  < 1 || startDateDay > 28) {
                        
                        return "please enter start date between 1 and 28"
                        
                        
                    }else{
                        
                        return "\(numOfDaysBetweenStartAndEndDate(startDateYear, yearEnd: endDateYear , monthStart: startDateMonth, monthEnd: endDateMonth, dayStart: startDateDay, dayEnd: endDateDay))"
                        
                    }
                }
                
            default:
                return "start month must be between 1 and 12"
                
                
                
            }
        }
    }
    
    func numOfDaysBetweenStartAndEndDate(yearStart:Int,yearEnd:Int,monthStart:Int,monthEnd:Int,dayStart:Int,dayEnd:Int)->String{
        switch monthEnd {
        case 1,3,5,7,8,10,12 :
            if dayEnd < 1 || dayEnd > 31 {
                
                return "please enter a date between 1 and 31"
                
                
            }else{
                
                return "\(getDifference(yearStart ,yearEnd: yearEnd , monthStart: monthStart , monthEnd: monthEnd , dayStart: dayStart , dayEnd: dayEnd))"
                
            }
            
        case 4,6,9,11 :
            if dayEnd < 1 || dayEnd > 30 {
                
                return "please enter a date between 1 and 30"
                
            }else{
                
                return "\(getDifference(yearStart ,yearEnd: yearEnd , monthStart: monthStart , monthEnd: monthEnd , dayStart: dayStart , dayEnd: dayEnd))"
                
            }
            
        case 2:
            if isLeapYear(yearEnd) {
                
                if dayEnd < 1 || dayEnd > 29 {
                    
                    return "please enter end date between 1 and 29"
                    
                    
                }else{
                    
                    return "\(getDifference(yearStart ,yearEnd: yearEnd , monthStart: monthStart , monthEnd: monthEnd , dayStart: dayStart , dayEnd: dayEnd))"
                }
                
            }else{
                if dayEnd < 1 || dayEnd > 28 {
                    
                    return "please enter end date between 1 and 28"
                    
                }else{
                    
                    return "\(getDifference(yearStart ,yearEnd: yearEnd , monthStart: monthStart , monthEnd: monthEnd , dayStart: dayStart , dayEnd: dayEnd))"
                }
            }
            
        default:
            return "end month must be between 1 and 12"
            
        }
    }
    
    func isLeapYear(year:Int)-> Bool{
        if (year % 400 == 0){
            
            return true;
            
        }
        if (year % 100 == 0){
            
            return false;
            
        }
        return (year % 4 == 0);
    }
    
    func getDifference(yearStart:Int,yearEnd:Int,monthStart:Int,monthEnd:Int,dayStart:Int,dayEnd:Int) -> Int
    {
        var monthDays = [31,28,31,30,31,30,31,31,30,31,30,31]
        var numberOfDaysBeforeStartDate:Int = 0
        var numberOfDaysBeforeEndDate:Int = 0
        
        numberOfDaysBeforeStartDate = yearStart * 365 + dayStart;
        
        
        for i in 0..<monthStart-1 {
            
            numberOfDaysBeforeStartDate += monthDays[i];
            
        }
        
        numberOfDaysBeforeStartDate += countLeapYears(yearStart,month: monthStart,day: dayStart);
        
        
        numberOfDaysBeforeEndDate = yearEnd*365 + dayEnd;
        
        for i in 0..<monthEnd-1 {
            
            numberOfDaysBeforeEndDate += monthDays[i];
            
        }
        numberOfDaysBeforeEndDate += countLeapYears(yearEnd,month: monthEnd,day: dayEnd);
        
        
        return (numberOfDaysBeforeEndDate - numberOfDaysBeforeStartDate);
    }
    
    func countLeapYears(year:Int,month:Int,day:Int)->Int
    {
        
        var years:Int = year
        
        if (month <= 2){
            
            years -= 1
            
        }
        
        return (years / 4) - (years / 100) + (years / 400)
    }
    
 }
