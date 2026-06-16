//
//  ContentView.swift
//  FinalProjectFoundation
//
//  Created by Beatriz Leonel on 28/05/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite


struct MainView: View {
    @State private var abaSelecionada = 1
    @State private var pesquisaExpandida = false
    @State private var textoPesquisa = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $abaSelecionada) {
                LocaisListView()
                    .tag(0)
                
                // Exibe a tela de pesquisa real quando a aba de busca estiver ativa por trás
                if abaSelecionada == 2 {
                    ResultadosPesquisaView(texto: $textoPesquisa)
                } else {
                    ProjetoListView()
                        .tag(1)
                }
            }
            
            // BARRA FLUTUANTE CUSTOMIZADA
            HStack(spacing: 0) {
                if !pesquisaExpandida {
                    // Estado Normal: Mostra os 3 botões lado a lado uniformemente
                    HStack(spacing: 0) {
                        // Botão 1: Locais
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) { abaSelecionada = 0 }
                        }) {
                            VStack(spacing: 4) {
                                Image(systemName: "diamond.fill")
                                    .font(.system(size: 18))
                                Text("Locais")
                                    .font(.system(size: 10, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(abaSelecionada == 0 ? .blue : .secondary)
                        }
                        
                        // Botão 2: Projetos
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) { abaSelecionada = 1 }
                        }) {
                            VStack(spacing: 4) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 18))
                                Text("Projetos")
                                    .font(.system(size: 10, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(abaSelecionada == 1 ? .blue : .secondary)
                        }
                        
                        // Botão 3: Pesquisa (Lupa) -> GERA A EXPANSÃO AO CLICAR
                        Button(action: {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                                abaSelecionada = 2
                                pesquisaExpandida = true
                            }
                        }) {
                            VStack(spacing: 4) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 18))
                                Text("Pesquisa")
                                    .font(.system(size: 10, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(abaSelecionada == 2 ? .blue : .secondary)
                        }
                    }
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading).combined(with: .opacity)))
                    
                } else {
                    // Estado Expandido: Mostra a barra de busca ocupando a pílula toda
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        
                        TextField("Search", text: $textoPesquisa)
                            .foregroundColor(.primary)
                        
                        // Botão Fechar (Volta ao estado normal dos 3 botões)
                        Button(action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                pesquisaExpandida = false
                                textoPesquisa = ""
                                abaSelecionada = 1 // Retorna para a aba principal de Projetos
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                                .font(.title3)
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color(.systemGray6))
                    .clipShape(Capsule())
                    .padding(.horizontal, 4)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
    }
}



// Nova view para exibir os resultados da busca quando expandido
struct ResultadosPesquisaView: View {
    @Binding var texto: String
    
    var body: some View {
        NavigationStack {
            VStack {
                if texto.isEmpty {
                    Text("O que você deseja procurar?")
                        .foregroundColor(.secondary)
                } else {
                    Text("Buscando por: \(texto)")
                        .bold()
                }
            }
            .navigationTitle("Buscar")
            .toolbar(.hidden, for: .tabBar) // <-- Remove a barra preta nesta tela
        }
    }
}


#Preview {
    MainView()
}
