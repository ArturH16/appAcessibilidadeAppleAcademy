//
//  LocalRowView.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI

struct LocalRowView: View {
        // Receber um album para ser exibido
    let local: Local
    
    
    var body: some View {
        HStack {
            LocalImageView(
                imagem: local.imagemPrincipal
            ).frame(width: 100, height: 100)
            // Exibir capa do Album em um frame 100 x 100
            
            
            // Exibir dados do verticalmente
            VStack(alignment: .leading) {
                Text(local.nomeLocal)
                
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}
