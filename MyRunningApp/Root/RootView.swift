//
//  RootView.swift
//  MyRunningApp
//
//  Created by Nithya Vasudevan on 14.03.24.
//

import SwiftUI

enum TabTitles : String {
    case plans, run, activity
    
    var title : String {
        switch self {
        case .plans : return "Plans"
        case .run : return "Run"
        case .activity : return "Activity"
        }
    }
}

struct RootView: View {
    
    @State var selectedTab : TabTitles
    
    var body: some View {
        NavigationStack{
            
            TabView(selection : $selectedTab) {
                PlansView()
                    .tabItem {  Label("Plans", systemImage: "doc.text")
                        }
                    .tag(TabTitles.plans)
                
                RunView()
                    .tabItem {  Label("Run", systemImage: "bolt.horizontal")
                        }
                    .tag(TabTitles.run)
                
                ActivityView()
                    .tabItem {  Label("Activity", systemImage: "chart.bar")
                        }
                    .tag(TabTitles.activity)
            }
            .navigationTitle(selectedTab.title)
            .toolbar(content: {
                Image(systemName: "person.fill")
            })
        }
    }
}

#Preview {
    NavigationStack {
        RootView(selectedTab: TabTitles.activity)
    }
}
