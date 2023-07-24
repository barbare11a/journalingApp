//
//  CalendarView.swift
//  JournalApp


import SwiftUI

struct CalendarView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    @Binding var myEmotion: String
    @Binding var emotionColor:String
    
    var body: some View
    {
        
        var currentDay = Calendar.current.component(.day, from: dateHolder.date)
        var currentMonth = Calendar.current.component(.month, from: dateHolder.date)
        
        NavigationView{
            
            
            VStack(spacing: 1)
            {
                
                
                HStack{
                    
                    NavigationLink(destination: ProfilePageView(myEmotion: $myEmotion, emotionColor: $emotionColor).environmentObject(dateHolder)) {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                            .fontWeight(.light)
                            .padding(.leading)
                            .padding(.leading)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                
                
                DateScrollerView()
                    .environmentObject(dateHolder)
                    .padding()
                dayOfWeekStack
                calendarGrid(currentDay: currentDay, currentMonth: currentMonth)

            }
        }
        
    }
    
    var dayOfWeekStack: some View
    {
        HStack(spacing: 1)
        {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
        .padding(.top)
        .padding(.leading)
        .padding(.trailing)
        
    }
    
    func calendarGrid(currentDay: Int, currentMonth: Int) -> some View
    {
        VStack(spacing: -30)
        {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            
            ForEach(0..<6)
            {
                
                row in
                HStack(spacing: 1)
                {
                    ForEach(1..<8)
                    {
                        column in
                        let count = column + (row * 7)
                        CalendarCell(count: count, startingSpaces:startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth, myEmotion: $myEmotion, currentMonth: currentMonth, currentDay: currentDay, emotionColor: $emotionColor)
                            .environmentObject(dateHolder)
                        
                    }
                }
            }
            
        }
        .frame(maxHeight: .infinity)
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
      
    }
}
struct CalendarView_Previews: PreviewProvider {
        

    static var previews: some View {
        
        let dateHolder = DateHolder()

        CalendarView(myEmotion: .constant("calm"), emotionColor: .constant("calm-color"))
            .environmentObject(dateHolder)
    }
}


extension Text
{
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
