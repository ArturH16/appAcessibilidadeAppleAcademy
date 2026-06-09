//
//  LocalImage.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI

struct LocalImageView: View {
    let imagem: Data? // o Data de uma imagem
       
                
    var body: some View {
        ZStack {
            Color.gray
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
        }
            // Caso a Imagem exista visualize ela
        .overlay {
            if let imagem = imagem,
               let uiImage = UIImage(data: imagem) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                
            }
        }
            
        
        
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
