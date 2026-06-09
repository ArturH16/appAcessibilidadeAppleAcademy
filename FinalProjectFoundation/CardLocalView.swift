//
//  CardLocalView.swift
//  FinalProjectFoundation
//
//  Created by found on 02/06/26.
//

import SwiftUI

struct CardLocalView: View {
    var local: Local
    
    var body: some View {
        HStack{
            Image(systemName: "photo.fill") // imagem do local
                .font(.system(size: 70))
                .foregroundStyle(.blue)
            
            
            
            VStack{
                Text(local.nomeLocal).font(.system(size: 20))
                Text(local.bairroLocal).font(.system(size: 18))
                
               }
               
            }
        .padding()
        .background{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.primary.opacity(0.5))
            }
        
        }
        
    }
    




//#Preview {
    //CardLocalView(local: Local(
      //  nomeLocal: "Praça Central",
  //      imagemPrincipal: Data(), // Dados vazios só pro preview funcionar
    //    recursos: "Wi-Fi, Bancos",
        //isFavorite: 0,
 //       descricaoLocal: "Uma praça bonita",
   //     bairroLocal: "Centro",
//     horarioFuncionamento: "08:00 - 22:00",
     //   diasFuncionamento: "Segunda a Sexta"
    //))
//}
