//
//  ProjetoImagemView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI

struct ProjetoListView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                Text("Tela de Projetos")
                    .font(.title2)
                    .bold()
                Text("Aqui ficará a sua lista de projetos dinâmicos.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .navigationTitle("Projetos")
        }
    }
}

