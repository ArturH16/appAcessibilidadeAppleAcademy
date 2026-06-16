//
//  FinalProjectFoundationApp.swift
//  FinalProjectFoundation
//
//  Created by Beatriz Leonel on 28/05/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite


@main
struct FinalProjectFoundationApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(
                    // ✅
                    for: [
                        EnderecoProjeto.self,
                        Projeto.self,
                        Endereco_local.self,
                        Local.self
                    ],
                    inMemory: true,
                    sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
                )

        }
    }
    
}
