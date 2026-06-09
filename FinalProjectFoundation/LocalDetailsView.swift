//
//  LocalDetailsView.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI

struct LocalDetailsView: View {
    var local: Local
    
    var body: some View {
        List {
            // Mostra a imagem Principal do local
            LocalImageView(imagem: local.imagemPrincipal)
            
            Section("Informações") {
                
                CardLocalView(local: local)
                Text(local.descricaoLocal)
                Text("Bairro: \(local.bairroLocal)")
                Text("Horário: \(local.horarioFuncionamento)")
                Text("Dias: \(local.diasFuncionamento)")
            }
            
            .listStyle(.plain)
            .navigationTitle(local.nomeLocal)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
