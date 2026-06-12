//
//  ProjetoListView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite

struct ProjetoListView: View {
    // O SwiftData busca automaticamente todos os projetos cadastrados no banco de dados pelo @Query
    @Query var projetos: [Projeto]
    
    var body: some View {
        NavigationStack {
            List {
                    //LISTA DE PROJETOS
                    if projetos.isEmpty {
                        Text("Nenhum Projeto Encontrado!")
                            .font(.system(size: 20,weight: .semibold))
                            .padding()
                        
                    }
                    else {
                                ForEach(projetos) { projeto in
                                    ProjetoRow(projeto: projeto )
                                }
                            
                       
                    }
                }
            .listStyle(.plain)
            .listRowSpacing(0)
            .navigationTitle("Projetos")
            .navigationSubtitle("Os mais populares até o momento")
            .toolbarTitleDisplayMode(.large)
            
            }
            
        }
    }





#Preview {
    ProjetoListView()
      
}
