//
//  ContentView.swift
//  FinalProjectFoundation
//
//  Created by Beatriz Leonel on 28/05/26.
//

import SwiftUI

struct MainView: View {
    // Criamos um estado (State) para controlar qual aba está selecionada atualmente.
    // 0 = Locais, 1 = Projetos
    @State private var abaSelecionada = 1 // Começa na aba "Projetos" (1) como no seu protótipo
    
    var body: some View {
        TabView(selection: $abaSelecionada) {
            
            // ABA 1: Locais
            LocaisPlaceholderView()
                .tabItem {
                    Label("Locais", systemImage: "diamond.fill")
                }
                .tag(0)
            
            // ABA 2: Projetos
            ProjetoListView()
                .tabItem {
                    Label("Projetos", systemImage: "circle.fill")
                }
                .tag(1)
            
            //3: Pesquisa
            PesquisaView()
                .tabItem {
                    Label("Pesquisa",systemImage: "magnifyingglass")
                }
                .tag(2)
            
                
            
              }
        
        
        // Aplica uma cor de destaque azul para a aba selecionada
        .accentColor(.blue)
    }
}


// Criamos estas telas simples apenas para o app não dar erro e podermos navegar entre as abas.

struct LocaisPlaceholderView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "diamond.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                Text("Tela de Locais")
                    .font(.title2)
                    .bold()
                Text("Aqui ficarão os locais fixos com endereço físico.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .navigationTitle("Locais")
        }
    }
}

struct PesquisaView: View {
    var body: some View {
        Text("comece a pesquisar")
    }
}


#Preview {
    MainView()
}
