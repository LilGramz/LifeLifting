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

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationLink(destination: CalendarView()) {
                Label("Calendar", systemImage: "calendar.circle")
            }
            .tag(Tab.calendar_circle)

            NavigationLink(destination: HomePageView()) {
                Label("House", systemImage: "house.fill")
            }
            .tag(Tab.house)

            NavigationLink(destination: AccountSettingsView()) {
                Label("Person", systemImage: "person.fill")
            }
            .tag(Tab.person)
        }
        .navigationBarTitle(selectedTab.rawValue.capitalized)

        CustomTabBar(selectedTab: $selectedTab)
            .padding()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
