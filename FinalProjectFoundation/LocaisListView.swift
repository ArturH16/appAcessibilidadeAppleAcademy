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
                    LocalRowView(local: Local)
                        .listRowSeparator(.hidden)
                }
               
               
            }
            .listStyle(.plain)
            .listRowSpacing(0)
            .navigationTitle("Locais")
            .navigationSubtitle("Os mais procurados do momento!")
            .toolbarTitleDisplayMode(.large)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}
    
#Preview {
    LocaisListView()
}
