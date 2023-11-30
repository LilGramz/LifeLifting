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
        
        
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) {
                    tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue.replacingOccurrences(of: "_", with: "."))
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundStyle(selectedTab == tab ? Color(.softPeach) : .black)
                        .font(.system(size: 22))
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
                
                
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
