//
//  ProjetoDetailsView.swift
//  FinalProjectFoundation
//
//  Created by Found on 12/06/26.
//

import SwiftUI


struct ProjetoDetailView: View {
    let projeto: Projeto
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ZStack(alignment: .topLeading) {
                        Image(uiImage: UIImage(data: projeto.imagemPrincipalProjeto)!)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                        
                        
                        // Botão Voltar Customizado
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                                .padding(12)
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        }
                        .padding(.top, 50)
                        .padding(.leading, 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 14) {
                        
                        // Título, Avaliação e Coração
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(projeto.nomeProjeto)
                                    .font(.title)
                                    .bold()
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                        // Endereço
                        Text(projeto.endereco.logradouro + " - ")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Divider()
                        
                        // Seção: Informações Gerais
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Informações gerais:")
                                .font(.headline)
                                .bold()
                            
                            Text(projeto.informacoesGerais ?? "OI")
                                .font(.body)
                                .foregroundColor(.primary)
                                .lineSpacing(4)
                        }
                        
                        // Seção: Recursos
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Recursos:")
                                .font(.headline)
                                .bold()
                            
                            Text(projeto.recursos ?? "OI")
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                        
                        // Seção: Dias e Horários
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Dias e Horário de Funcionamento:")
                                .font(.headline)
                                .bold()
                            
                            Text(projeto.diasFuncionamento + " - " +  projeto.horarioFuncionamento)
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .ignoresSafeArea(.container, edges: .top)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}
    #Preview {
        let imagemData = UIImage(resource: .projetoRemar).pngData()!
        let enderecoFalso = EnderecoProjeto( id: 1,
                                             logradouro: "Rua Plácido de Castro, 35 A")
        let projetoFalso = Projeto(
            id: 1,
            nomeProjeto: "Projeto Remar",
            recursos: "Atendimento familiar, diagnóstico e acompanhamento para TEA e síndrome de Down.",
            dataInicio: "2013",
            dataFim: nil,
            imagemPrincipalProjeto: imagemData,
            distancia: 5,
            colaboradores: nil,
            diasFuncionamento: "Qua a Sab",
            horarioFuncionamento: " - 07:00 : 09:00",
            informacoesGerais: "Iniciativa de inclusão social e esportiva que promove a prática de esportes aquáticos adaptados (como canoagem e stand-up paddle) para pessoas com deficiência e seus familiares. Ele utiliza o mar e a Lagoa do Colosso como ferramentas de reabilitação, lazer e autonomia.",
            endereco: enderecoFalso
        )
        ProjetoDetailView(projeto: projetoFalso)
    }
    
