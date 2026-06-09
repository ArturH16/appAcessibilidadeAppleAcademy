//
//  ProjetoCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import Foundation
import SwiftData
import SwiftUI


@Model
class Projeto: Identifiable {
    var id: Int
    var nomeProjeto: String
    var recursos: [String]
    var dataInicio: String
    var dataFim: String?
    var imagemPrincipalProjeto: Data
    var distancia: Int?
    var colaboradores: String?
    var diasFuncionamento: String
    var horarioFuncionamento: [String]
    @Relationship var endereco: EnderecoProjeto?
    
    init(id: Int = Int.random(in: 1...10000000),
         nomeProjeto: String,
         recursos: [String] ,
         dataInicio: String ,
         dataFim: String? = "",
         imagemPrincipalProjeto: Data,
         distancia : Int? = nil,
         colaboradores: String? = "",
         diasFuncionamento: String ,
         horarioFuncionamento: [String],
         endereco: EnderecoProjeto? = nil
    ) {
        self.id = id
        self.nomeProjeto = nomeProjeto
        self.recursos = recursos
        self.dataInicio = dataInicio
        self.dataFim = dataFim
        self.imagemPrincipalProjeto = imagemPrincipalProjeto
        self.distancia = distancia
        self.colaboradores = colaboradores
        self.diasFuncionamento = diasFuncionamento
        self.horarioFuncionamento = horarioFuncionamento
        self.endereco = endereco
    }

}


@Model
class EnderecoProjeto: Identifiable {
    var id: Int
    var logradouro: String
    var numero: String?
    var complemento: String?
    var cidade: String?
    var bairro: String
    var estado: String?
    var cep: String?
    @Relationship(inverse: \Projeto.endereco) var projeto: Projeto?
    
    
    init(id: Int, logradouro: String, numero: String? = nil,
         complemento: String? = nil,
         cidade: String? = "Fortaleza",
         bairro: String,
         estado: String? = "CE", cep: String? = nil, projeto: Projeto? = nil) {
        self.id = id
        self.logradouro = logradouro
        self.numero = numero
        self.complemento = complemento
        self.cidade = cidade
        self.bairro = bairro
        self.estado = estado
        self.cep = cep
        self.projeto = projeto
    }
}

