//
//  CalendarView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/23/23.
//

// CalendarView.swift
import SwiftUI

struct CalendarView: View {
    @State private var selectedTab: Tab = .calendar_circle
    @State private var gymDays: [Date] = []
    @State private var selectedDaysPerWeek: Int = 3 // Default value, you can change this
    
    // Additional preferences
    @State private var fitnessGoal: String = ""
    @State private var workoutSetting: String = ""
    @State private var fitnessLevel: String = ""
    
    init() {
        UITabBar.appearance().isHidden = true
        selectedTab = .calendar_circle
    }

    var body: some View {
        NavigationView {
            VStack {
                Color(.dentureGlue)
                    .ignoresSafeArea()
                
                NavigationLink(destination: preferenceView(
                    fitnessGoal: $fitnessGoal,
                    workoutSetting: $workoutSetting,
                    fitnessLevel: $fitnessLevel,
                    daysPerWeek: $selectedDaysPerWeek
                ).navigationBarBackButtonHidden(true)) {
                    Text("Set Preferences")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }

                preferenceView(selectedDaysPerWeek: $selectedDaysPerWeek)

                LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                    ForEach(monthDates(), id: \.self) { date in
                        GymDayCell(date: date, gymDays: $gymDays, selectedDaysPerWeek: selectedDaysPerWeek)
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

        return Calendar.current.generateDates(inside: startOfMonth...endOfMonth) { (date, _, components) in
            let isStartOfMonth = Calendar.current.isDate(date, equalTo: startOfMonth, toGranularity: .month)
            let isEndOfMonth = Calendar.current.isDate(date, equalTo: endOfMonth, toGranularity: .month)
            let isWeekdaySelected = components.weekday.map { selectedDaysPerWeek & (1 << ($0 - 1)) != 0 } ?? false
            return isStartOfMonth || isEndOfMonth || isWeekdaySelected
        } ?? []
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
