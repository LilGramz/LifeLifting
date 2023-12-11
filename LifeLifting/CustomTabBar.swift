//
//  CustomTabBar.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/29/23.
//

import SwiftUI
enum Tab: String, CaseIterable{
    
    case calendar_circle
    case house
    case person
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        switch selectedTab {
        case .calendar_circle:
            return "calendar.circle.fill"
        default:
            return selectedTab.rawValue + ".fill"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    NavigationLink(
                        destination: destinationView(for: tab)
                            .tag(tab) // Set the tag directly
                            .navigationBarHidden(true) // Hide the navigation bar
                            .navigationBarTitle("", displayMode: .inline),
                        label: {
                            Image(systemName: selectedTab == tab ? fillImage : tab.rawValue.replacingOccurrences(of: "_", with: "."))
                                .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                                .foregroundStyle(selectedTab == tab ? Color(.softPeach) : .black)
                                .font(.system(size: 22))
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                    )
                    .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to make it look like a button
                    .accentColor(Color.clear) // Set accent color to clear to remove the underline
                }
            }
            .frame(height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
    
    private func destinationView(for tab: Tab) -> some View {
        switch tab {
        case .calendar_circle:
            return AnyView(NavigationView { CalendarView() })
        case .house:
            return AnyView(NavigationView { HomePageView() })
        case .person:
            return AnyView(NavigationView { AccountSettingsView() })
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
            .background(Color(.clear))
    }
}
