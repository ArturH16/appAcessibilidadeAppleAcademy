//
//  LocalView.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite




struct LocalView: View {
    @Query var locais: [Local]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(locais) {
                    local in NavigationLink {
                        LocalDetailsView(local: local)
                    } label: {
                        LocalRowView(local: local)
                    }
                    .listRowSeparator(.hidden)
                    .padding(8)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.primary.opacity(0.5))
                    }
                }
                
            }
            .listStyle(.plain)
                .navigationTitle("Locais")
                .navigationSubtitle("Todos os locais da biblioteca")
                .toolbarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    LocalView()
        .modelContainer( // ✅
            for: [Local.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "database", ofType: "sqlite")!
        )
}


