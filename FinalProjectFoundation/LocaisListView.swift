//
//  LocaisListView.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite

struct LocaisListView: View {
    @Query var locais: [Local]
    
    var body: some View {
        NavigationStack {
            List {
                if locais.isEmpty {
                    Text("Nenhum Local Encontrado!")
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                } else {
                    ForEach(locais) { local in
                        LocalRowView(local: local)
                            .listRowSeparator(.hidden)
                    }
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
    LocaisListView().modelContainer(
        // ✅
        for: [
            Endereco_local.self,
            Local.self
        ],
        inMemory: true,
        sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
    )
}
