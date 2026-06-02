//
//  LocalView.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//

import SwiftUI

struct LocalView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading){
                    Image(.local)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(18)
                    
                    Button(action: {
                        dismiss() //Fecha a tela e volta para a anterior
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 35,height: 50)
                            .background(Color.white.opacity(0.8))
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding(.top,70)
                    .padding(.leading,16)
                }
                HStack(spacing: 8) {
                        Text("Espaco Girassol")
                            .padding(.leading,10)
                            .padding(.top,10)
                            .font(.title)
                            .bold()
                        ForEach(0..<5,id: \.self) {
                        _ in Image(systemName: "star")
                            .font(.subheadline)
                            .padding(.top,15)
                    }
                        Image(systemName: "heart")
                        .padding(.leading,10)
                        .padding(.top,0)
                        .font(.title2)
                        
                
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                Text("R. Plácido de Castro, 35 A - Vila Peri, Fortaleza - CE, 60730-170")
                    .font(.system(size: 15))
                    .padding(.top,15)
                    .foregroundColor(.black.opacity(0.7))
                
                HStack() {
                    Text("Informações Gerais")
                        .padding(.top,40)
                        .padding(.leading)
                        .bold()
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Text("O Espaço Girassol é uma rede municipal de Fortaleza dedicada ao acolhimento, diagnóstico e terapias para crianças e adolescentes (3 a 17 anos) com neurodivergências e transtornos do neurodesenvolvimento, como o Transtorno do Espectro Autista (TEA).")
                    .padding(.top,10)
                
                HStack() {
                    Text("Recursos")
                        .padding(.top,40)
                        .padding(.leading)
                        .bold()
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Text("Atendimento familiar, diagnóstico e acompanhamento para TEA e síndrome de Down.")
                    .padding(.top,10)
                
                HStack() {
                    Text("Dias e Horários de Funcionamento")
                        .padding(.top,40)
                        .padding(.leading)
                        .bold()
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                HStack() {
                    Text("Seg a Sab - 08:00 - 20:00")
                        .padding(.top,10)
                        .padding(.leading)
                        
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                    
                
                

        
                
            }
        }
        .ignoresSafeArea()
    }
}



#Preview {
    LocalView()
}
