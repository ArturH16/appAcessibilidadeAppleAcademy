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
    @State private var abaSelecionada = 0
    @State private var pesquisaExpandida = false
    @State private var textoPesquisa = ""
    @State private var abaAnterior = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // 1. ESTRUTURA DO TABVIEW FIXA
            TabView(selection: $abaSelecionada) {
                LocaisListView()
                    .tag(0)
                
                ProjetoListView()
                    .tag(1)
                
                Color.clear
                    .tag(2)
            }
            
            // 2. SOBREPOSIÇÃO DA TELA DE BUSCA FLUTUANTE
            if pesquisaExpandida {
                ResultadosPesquisaView(texto: $textoPesquisa)
                    .padding(.bottom, 80) // Dá espaço para a barra de botões flutuante
                    .background(Color(.systemGroupedBackground))
                    .transition(.opacity)
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
                                Image(systemName: "map")
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
                                Image(systemName: "person.2")
                                    .font(.system(size: 18))
                                Text("Projetos")
                                    .font(.system(size: 10, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(abaSelecionada == 1 ? .blue : .secondary)
                        }
                        
                        // Botão 3: Pesquisa (Lupa)
                        Button(action: {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                                abaAnterior = abaSelecionada
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
                            .autocorrectionDisabled()
                        
                        // Botão Fechar
                        Button(action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                pesquisaExpandida = false
                                textoPesquisa = ""
                                abaSelecionada = abaAnterior
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
            .background(Color(.systemBackground))
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
    }
}

struct ResultadosPesquisaView: View {
    @Binding var texto: String
    
    @Query var todosProjetos: [Projeto]
    @Query var todosLocais: [Local]
    
    var projetosFiltrados: [Projeto] {
        if texto.isEmpty { return [] }
        return todosProjetos.filter { projeto in
            (projeto.recursos ?? "").localizedCaseInsensitiveContains(texto)
        }
    }
    
    var locaisFiltrados: [Local] {
        if texto.isEmpty { return [] }
        return todosLocais.filter { local in
            local.recursos.localizedCaseInsensitiveContains(texto)
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if texto.isEmpty {
                    ContentUnavailableView(
                        "O que você deseja procurar?",
                        systemImage: "magnifyingglass",
                        description: Text("Digite palavras-chave para encontrar recursos de locais e projetos.")
                    )
                } else if projetosFiltrados.isEmpty && locaisFiltrados.isEmpty {
                    ContentUnavailableView("Nenhum resultado para \"\(texto)\"",
                                                  systemImage: "magnifyingglass",
                                                  description: Text("Verifique a ortografia ou tente uma nova busca."))
                } else {
                    List {
                        // --- SEÇÃO DE PROJETOS ---
                        if !projetosFiltrados.isEmpty {
                            Section("Projetos") {
                                ForEach(projetosFiltrados) { projeto in
                                    NavigationLink(destination: ProjetoDetailView(projeto: projeto)) {
                                        HStack(spacing: 16) {
                                            // 1. Imagem Miniatura Arredondada à esquerda
                                            if let uiImage = UIImage(data: projeto.imagemPrincipalProjeto) {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 95, height: 60)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            } else {
                                                Color.gray.opacity(0.2)
                                                    .frame(width: 95, height: 60)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                                    .overlay(Image(systemName: "photo").foregroundColor(.secondary))
                                            }
                                            
                                            // 2. Textos Centrais
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(projeto.nomeProjeto)
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.primary)
                                                    .lineLimit(1)
                                                
                                                Text("Aberto")
                                                    .font(.system(size: 11, weight: .semibold))
                                                    .foregroundColor(Color(red: 0.18, green: 0.75, blue: 0.45))
                                                    .padding(.horizontal, 8)
                                                    .padding(.vertical, 3)
                                                    .background(Color(red: 0.18, green: 0.75, blue: 0.45).opacity(0.12))
                                                    .clipShape(Capsule())
                                            }
                                        }
                                        .padding(.vertical, 4)
                                    }
                                }
                            }
                        }
                        
                        // --- SEÇÃO DE LOCAIS ---
                        if !locaisFiltrados.isEmpty {
                            Section("Locais") {
                                ForEach(locaisFiltrados) { local in
                                    NavigationLink(destination: LocalDetailsView(local: local)) {
                                        HStack(spacing: 16) {
                                            // 1. Imagem do Local
                    
                                            if let uiImage = UIImage(data: local.imagemPrincipal) {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 95, height: 60)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            } else {
                                                // Mantém o placeholder cinza caso dê erro ao converter os bytes da foto
                                                Color.gray.opacity(0.2)
                                                    .frame(width: 95, height: 60)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                                    .overlay(Image(systemName: "map").foregroundColor(.secondary))
                                            }

                                            
                                            // 2. Textos do Local
                                            VStack(alignment: .leading, spacing: 4) {
                                                // Exibe o nome real (ex: local.nomeLocal)
                                                Text(local.nomeLocal)
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.primary)
                                                    .lineLimit(1)
                                                
                                                Text("Aberto")
                                                    .font(.system(size: 11, weight: .semibold))
                                                    .foregroundColor(Color(red: 0.18, green: 0.75, blue: 0.45))
                                                    .padding(.horizontal, 8)
                                                    .padding(.vertical, 3)
                                                    .background(Color(red: 0.18, green: 0.75, blue: 0.45).opacity(0.12))
                                                    .clipShape(Capsule())
                                            }
                                        }
                                        .padding(.vertical, 4)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Buscar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}





#Preview {
    MainView().modelContainer(
            // ✅
            for: [
                EnderecoProjeto.self,
                Projeto.self,
                Endereco_local.self,
                Local.self
            ],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
