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
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    //(Título, Subtítulo e Ícone)
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Projetos")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(.primary)
                            
                            Text("Os mais populares até o momento")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        
                        Image(systemName: "list.clipboard.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // 2. LISTA DE PROJETOS
                    if projetos.isEmpty {
                        Text("Nenhum Projeto Encontrado!")
                            .font(.system(size: 20,weight: .semibold))
                            .padding()
                        
                    }
                    else {
                        VStack(spacing: 16) {
                                ForEach(projetos) { projeto in
                                    ProjetoRow(projeto: projeto )
                                }
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(Color(.systemGroupedBackground).opacity(0.4))
        }
    }
}




#Preview {
    ProjetoListView()
      
}
