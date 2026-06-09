//
//  ProjetoRow.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI

struct ProjetoRow: View {
    let projeto: Projeto
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: projeto.imagemPrincipalProjeto)!)
                .resizable()
                .scaledToFit()
                .frame(width: 110,height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading,spacing: 4) {
                Text(projeto.nomeProjeto)
                    .font(.system(size: 16,weight: .bold))
                    .foregroundColor(.primary)
                
                if let bairro = projeto.endereco?.bairro {
                    Text(bairro)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14,weight: .semibold))
                .foregroundColor(.gray.opacity(0.4))
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(15)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
}


#Preview {
    let enderecoTeste = EnderecoProjeto(
        id: 1,
        logradouro: "Av Beira Mar",
        bairro: "Praia de Iracema"
    )
    
    let imagemData = UIImage(resource: .praiaAcessivel).pngData()!
    
    let projetoTeste = Projeto(id: 1,
    nomeProjeto: "Praia Acessível",
    imagemPrincipalProjeto: imagemData,
    endereco: enderecoTeste)
    
    ProjetoRow(projeto: projetoTeste)
        .padding()
        .background(Color(.systemGroupedBackground))
}
