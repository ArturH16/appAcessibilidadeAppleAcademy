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
          ScrollView {
              VStack(alignment: .leading, spacing: 16) {
                  ZStack(alignment: .topLeading) {
                      Image(.praiaAcessivel)
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
                      Text(projeto.endereco.logradouro)
                          .font(.caption)
                          .foregroundColor(.secondary)
                      
                      Divider()
                      
                      // Seção: Informações Gerais
                      VStack(alignment: .leading, spacing: 6) {
                          Text("Informações gerais:")
                              .font(.headline)
                              .bold()
                          
                          Text(projeto.informacoesGerais)
                              .font(.body)
                              .foregroundColor(.primary)
                              .lineSpacing(4)
                      }
                      
                      // Seção: Recursos
                      VStack(alignment: .leading, spacing: 6) {
                          Text("Recursos:")
                              .font(.headline)
                              .bold()
                          
                          Text("Atendimento familiar, diagnóstico e acompanhamento para TEA e síndrome de Down.")
                              .font(.body)
                              .foregroundColor(.primary)
                      }
                      
                      // Seção: Dias e Horários
                      VStack(alignment: .leading, spacing: 6) {
                          Text("Dias e Horário de Funcionamento:")
                              .font(.headline)
                              .bold()
                          
                          Text(projeto.diasFuncionamento + projeto.horarioFuncionamento)
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

  #Preview {
      let enderecoFalso = EnderecoProjeto( id: 1,
                        logradouro: "Rua Plácido de Castro, 35 A")
      let projetoFalso = Projeto(
            id: 1,
            nomeProjeto: "Espaço Girassol",
            recursos: "Atendimento familiar, diagnóstico e acompanhamento para TEA e síndrome de Down.",
            dataInicio: "2026",
            dataFim: nil,
            imagemPrincipalProjeto: Data(), // Passa um dado binário vazio para testes
            distancia: 5,
            colaboradores: nil,
            diasFuncionamento: "Seg a Sab",
            horarioFuncionamento: " - 08:00 : 20:00",
            informacoesGerais: "O Espaço Girassol é uma rede municipal de Fortaleza dedicada ao acolhimento, diagnóstico e terapias para crianças e adolescentes (3 a 17 anos) com neurodivergências e transtornos do neurodesenvolvimento, como o Transtorno do Espectro Autista (TEA).",
            endereco: enderecoFalso
           )
      ProjetoDetailView(projeto: projetoFalso)
  }


