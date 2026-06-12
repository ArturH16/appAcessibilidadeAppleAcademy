//
//  LocaisListView.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI
import SwiftData

struct LocaisListView: View {
    @Query var locais: [Local]
    
    var body: some View {
        NavigationStack {
            List {
                // for elemento in musics {}
                ForEach(locais) { Local in
                    CardLocalView(local: Local)
                        .listRowSeparator(.hidden)
                }
               
               
            }
            .listStyle(.plain)
            .listRowSpacing(0)
            .navigationTitle("Músicas")
            .navigationSubtitle("A Vibe do Momento")
            .toolbarTitleDisplayMode(.large)
        }
    }
}
    
#Preview {
    LocaisListView()
}
