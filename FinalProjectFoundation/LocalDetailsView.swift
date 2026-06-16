//
//  LocalDetailsView.swift
//  FinalProjectFoundation
//
//  Created by found on 09/06/26.
//

import SwiftUI

struct LocalDetailsView: View {
    let local: Local
    @Environment(\.dismiss) private var dismiss
    var body: some View {
          ScrollView {
              VStack(alignment: .leading, spacing: 16) {
                  ZStack(alignment: .topLeading) {
                      Image(uiImage: UIImage(data: local.imagemPrincipal)!)
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
                              Text(local.nomeLocal)
                                  .font(.title)
                                  .bold()
                          
                          }
                          
                          Spacer()
                        
                      }
                      
                      // Endereço
                      Text(local.endereco.logradouro)
                          .font(.caption)
                          .foregroundColor(.secondary)
                      
                      Divider()
                      
                      // Seção: Informações Gerais
                      VStack(alignment: .leading, spacing: 6) {
                          Text("Informações gerais:")
                              .font(.headline)
                              .bold()
                          
                          Text(local.descricaoLocal)
                              .font(.body)
                              .foregroundColor(.primary)
                              .lineSpacing(4)
                      }
                      
                      // Seção: Recursos
                      VStack(alignment: .leading, spacing: 6) {
                          Text("Recursos:")
                              .font(.headline)
                              .bold()
                          
                          Text(local.recursos)
                              .font(.body)
                              .foregroundColor(.primary)
                      }
                      
                      // Seção: Dias e Horários
                      VStack(alignment: .leading, spacing: 6) {
                          Text("Dias e Horário de Funcionamento:")
                              .font(.headline)
                              .bold()
                          
                          Text(local.diasFuncionamento + local.horarioFuncionamento)
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
      let imagemData = UIImage(resource: .projetoRemar).pngData()!
      let enderecoFalso = Endereco_local( id: 1,
                        logradouro: "Rua Plácido de Castro, 35 A",
                        numero: "105",
                        complemento: "dbggsavd",
                        bairro: "bgva",
                        cidade: "bdfvgv",
                        estado: "gfsgfab",
                        cep: "bscgvsgfvg")
      let localFalso = Local(
            id: 1,
            nomeLocal: "Projeto Remar",
            imagemPrincipal: imagemData,
            recursos: "Atendimento familiar, diagnóstico e acompanhamento para TEA e síndrome de Down.",
            descricaoLocal: "Iniciativa de inclusão social e esportiva que promove a prática de esportes aquáticos adaptados (como canoagem e stand-up paddle) para pessoas com deficiência e seus familiares. Ele utiliza o mar e a Lagoa do Colosso como ferramentas de reabilitação, lazer e autonomia.",
            bairroLocal: "Strin",
            horarioFuncionamento: " - 07:00 : 09:00",
            diasFuncionamento: "Qua a Sab",
            endereco: enderecoFalso
           )
      LocalDetailsView(local: localFalso)
  }

