//
//  RootView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/30/23.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: Tab = .house
    @State private var currentImageIndex = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationLink(destination: CalendarView()) {
                Label("Calendar", systemImage: "calendar.circle")
            }
            .tag(Tab.calendar_circle)
            .navigationTitle("Calendar")

            NavigationLink(destination: HomePageView()) {
                Label("House", systemImage: "house.fill")
            }
            .tag(Tab.house)
            .navigationTitle("Home")

            NavigationLink(destination: AccountSettingsView()) {
                Label("Person", systemImage: "person.fill")
            }
            .tag(Tab.person)
            .navigationTitle("Account")
        }
        .padding()

        CustomTabBar(selectedTab: $selectedTab)
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
