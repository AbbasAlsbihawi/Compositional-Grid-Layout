//
//  CompositionalLayout.swift
//  Compositional Grid Layout
//
//  Created by Abbas on 10/08/2024.
//

import SwiftUI

struct CompositionalLayout<Content: View>: View {
    var count: Int = 3
    var spacing: CGFloat = 6
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        Group {
            let subviews = content().extractSubviews()
            let chunked = subviews.chunked(count)
             
            
            ForEach(chunked) { chunk in
                HStack(spacing: spacing) {
                    ForEach(chunk.collection.indices, id: \.self) { index in
                        chunk.collection[index]
                    }
                }
            }
        }
    }
}

fileprivate extension Array where Element == AnyView {
    func chunked(_ size: Int) -> [ChunkedCollection] {
        stride(from: 0, to: count, by: size).map {
            let collection = Array(self[$0..<Swift.min($0 + size, count)])
            return ChunkedCollection(layoutID: $0, collection: collection)
        }
    }
    
    struct ChunkedCollection: Identifiable {
        var id: UUID = .init()
        var layoutID: Int
        var collection: [AnyView]
    }
}

fileprivate extension View {
    func extractSubviews() -> [AnyView] {
        Mirror(reflecting: self).children.compactMap { child in
            if let view = child.value as? any View {
                return AnyView(view)
            }
            return nil
        }
    }
}


 

#Preview {
    ContentView()
}
