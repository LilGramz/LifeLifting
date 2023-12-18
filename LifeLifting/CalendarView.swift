//
//  CalendarView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedTab: Tab = .calendar_circle
    @State private var tapCount = 0
    @State private var markedDays: [Date: MarkType] = [:]
    
    enum MarkType {
        case blueO
        case redX
    }
    
    init() {
        UITabBar.appearance().isHidden = true
        selectedTab = .calendar_circle
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Color(.dentureGlue)
                    .ignoresSafeArea()
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                    ForEach(monthDates(), id: \.self) { date in
                        ZStack {
                            Text("\(date.day)")
                                .padding()
                                .background(markedDays[date] == .blueO ? Color.blue : markedDays[date] == .redX ? Color.red : Color.clear)
                                .clipShape(Circle())
                                .onTapGesture {
                                    tapCount += 1
                                    switch tapCount % 3 {
                                    case 1:
                                        // Blue "O" on the first tap
                                        markedDays[date] = .blueO
                                    case 2:
                                        // Red "X" on the second tap
                                        markedDays[date] = .redX
                                    case 0:
                                        // Remove marking on the third tap
                                        markedDays[date] = nil
                                    default:
                                        break
                                    }
                                }
                            
                            if let markType = markedDays[date] {
                                Text(markType == .redX ? "X" : "O")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)
            }
            .navigationBarTitle("Gym Calendar")
        }
    }
    
    private func monthDates() -> [Date] {
        let today = Date()
        guard let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: today)),
              let endOfMonth = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth) else {
            return []
        }
        
        return Calendar.current.generateDates(startingAfter: startOfMonth, endingBefore: endOfMonth)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

extension Date {
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
}

extension Calendar {
    func generateDates(startingAfter startDate: Date, endingBefore endDate: Date) -> [Date] {
        var currentDate = startDate
        var dates: [Date] = []
        
        while currentDate <= endDate {
            dates.append(currentDate)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) else {
                break
            }
            currentDate = newDate
        }
        
        return dates
    }
}
