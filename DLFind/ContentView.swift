//
//  ContentView.swift
//  NJDriver'sLicense
//
//  Created by David Empire on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    
    // Defines the list of the states
    @State private var states: [ (name: String, destination: AnyView) ] = [
        (name: "New Jersey", destination: AnyView(NJView())),
        (name: "Montana", destination: AnyView(MTView())),
        (name: "North Dakota", destination: AnyView(NDView()))
    ]
    
    // Defines the inputted text into the search bar
    @State private var searchText = ""
    
    var body: some View {
            NavigationView {
                List {
                    Section {
                        
                        // Displays the states list dependent on the search results
                        ForEach(searchResults, id: \.name) { state in
                            NavigationLink (state.name, destination: state.destination)
                        }
                        
                        // Allows the user to rearrange the states on the list
                        .onMove { indices, newOffset in
                                states.move(
                                    fromOffsets: indices,
                                    toOffset: newOffset
                                )
                            }
                        
                        // List header
                    } header: {
                        Text("States")
                    }
                }
                
                // View title
                .navigationTitle("DLFind")
                
                // Enables search functionality and puts the search bar in the sidebar on iPadOS and macOS
                .searchable(text: $searchText, placement: .sidebar)
                
                // Enables sidebar on iPadOS and macOS
                .listStyle(SidebarListStyle())
                .frame(minWidth: 225)
                
                // Enables "No State Selected" text on iPadOS and macOS
                VStack {
                    Text("No State Selected").fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
            }
        
            // Enables toolbar and sidebar toggle button
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: { // 1
                        Image(systemName: "sidebar.leading")
                    })
                }
            }
        }
        
        // Analyzes search results
        var searchResults: [ (name: String, destination: AnyView) ] {
            if searchText.isEmpty {
                return states
            } else {
                return states.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
        // Controls the sidebar
        private func toggleSidebar() { // 2
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
        }
    }
