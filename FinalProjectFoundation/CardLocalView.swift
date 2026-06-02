//
//  CardLocalView.swift
//  FinalProjectFoundation
//
//  Created by found on 02/06/26.
//

import SwiftUI

struct CardLocalView: View {
    var local: Local
    var bairro: Bairro
    
    var body: some View {
        HStack{
            Image(systemName: "photo.fill") // imagem do local
                .font(.system(size: 70))
                .foregroundStyle(.blue)
            
            
            
            VStack{
                Text(local.name)
                Text(bairro.name)
                
               }
               
            }
        .padding()
        .background{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.primary.opacity(0.5))
            }
        
        }
        
    }
    




#Preview {
 CardLocalView()
}
