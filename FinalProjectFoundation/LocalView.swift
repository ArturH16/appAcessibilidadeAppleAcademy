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
                
            }
        }
        .ignoresSafeArea()
    }
}



#Preview {
    LocalView()
}
