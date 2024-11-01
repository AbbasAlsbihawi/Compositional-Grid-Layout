//
//  ContentView.swift
//  Compositional Grid Layout
//
//  Created by Abbas on 09/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVStack(spacing:6){
                    CompositionalLayout{
                        ForEach(1...50,id:\.self){ _ in
                            Rectangle()
                                .fill(.black.gradient)
                        }
                        ForEach(1...50,id:\.self){ _ in
                            Rectangle()
                                .fill(.black.gradient)
                        }

                        
                    }
                    
                }
                .padding(15)
            }
            .navigationTitle("Compositional Grid")
        }
    }
}

#Preview {
    ContentView()
}
