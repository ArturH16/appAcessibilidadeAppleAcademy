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
            if let uiImage = UIImage(data: projeto.imagemPrincipalProjeto) {
                // Se der certo, mostramos a imagem do projeto
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 75)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            } else {
                // Se der errado (else), mostramos um ícone padrão do sistema
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 75)
                    .foregroundColor(.gray.opacity(0.6))
                    .padding(10) // Um recuo para o ícone não encostar nas bordas
                    .background(Color.gray.opacity(0.1)) // Um fundo cinza clarinho
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(projeto.nomeProjeto)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
                
//                if let bairro = projeto.endereco?.bairro {
//                    Text(bairro)
//                        .font(.system(size: 14))
//                        .foregroundColor(.secondary)
//                }
                
                Text("Aberto")
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .foregroundColor(Color.green)
                    .background(Color.green.opacity(0.12))
                    .clipShape(Capsule())
            }
            
            Spacer(minLength: 2)
            

        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
    
    let projetoTeste = Projeto(
        id: 1,
        nomeProjeto: "Praia Acessível",
        imagemPrincipalProjeto: imagemData,
        endereco: enderecoTeste
    )
    
    ProjetoRow(projeto: projetoTeste)
        .padding()
        .background(Color(.systemGroupedBackground))
}

