//
//  ContentView.swift
//  DLFind
//
//  Created by David Empire on 11/21/22.
//

import SwiftUI

//Lays the groundwork for enabling sidebar to show on launch on iPad Portrait Mode and iPhone Landscape Mode
#if os(iOS)
import UIKit

struct UIKitShowSidebar: UIViewRepresentable {
  let showSidebar: Bool
  
  func makeUIView(context: Context) -> some UIView {
    let uiView = UIView()
    if self.showSidebar {
      DispatchQueue.main.async { [weak uiView] in
        uiView?.next(of: UISplitViewController.self)?
          .show(.primary)
      }
    } else {
      DispatchQueue.main.async { [weak uiView] in
        uiView?.next(of: UISplitViewController.self)?
          .show(.secondary)
      }
    }
    return uiView
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    DispatchQueue.main.async { [weak uiView] in
      uiView?.next(
        of: UISplitViewController.self)?
        .show(showSidebar ? .primary : .secondary)
    }
  }
}

extension UIResponder {
  func next<T>(of type: T.Type) -> T? {
    guard let nextValue = self.next else {
      return nil
    }
    guard let result = nextValue as? T else {
      return nextValue.next(of: type.self)
    }
    return result
  }
}
#endif


struct ContentView: View {
    
    // Defines the list of the states
    @State private var states: [ (name: String, destination: AnyView) ] = [
        (name: "New Jersey", destination: AnyView(NJView())),
        (name: "Montana", destination: AnyView(MTView())),
        (name: "North Dakota", destination: AnyView(NDView()))
    ]
    
    // Makes the Navigation Title orange on iOS
    #if os(iOS)
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.systemOrange))]
    }
    #endif
    
    // Defines the inputted text into the search bar
    @State private var searchText = ""
    
    //Variable for showing sidebar
    @State var showSidebar: Bool = false
    
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
                
                // Enables "No State Selected" text on macOS
                #if os(macOS)
                VStack {
                    Text("No State Selected").fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                #endif
                
                //Enables sidebar to show on launch on iPad Portrait Mode and iPhone Landscape Mode
                #if os(iOS)
                UIKitShowSidebar(showSidebar: showSidebar)
                    .frame(width: 0,height: 0)
                    .onAppear {
                        showSidebar = true
                    }
                    .onDisappear {
                        showSidebar = false
                    }
                #endif
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


