//
//  ProjetoCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import Foundation
import SwiftData
import SwiftDataSQLite

@SQLiteTable("projetos")
@Model
class Projeto: Identifiable {
    @SQLiteColumn("idProjetos")
    var id: Int
    var nomeProjeto: String
    var recursos: String?
    var dataInicio: String
    var dataFim: String?
    var imagemPrincipalProjeto: Data
    var distancia: Int?
    var colaboradores: String?
    var diasFuncionamento: String
    var horarioFuncionamento: String
    var informacoesGerais: String?
    @SQLiteColumn("idEndereco")
    @Relationship var endereco: EnderecoProjeto
    
    init(
        id: Int,
        nomeProjeto: String,
        recursos: String? = nil,
        dataInicio: String = "",
        dataFim: String? = nil,
        imagemPrincipalProjeto: Data,
        distancia: Int? = nil,
        colaboradores: String? = nil,
        diasFuncionamento: String = "",
        horarioFuncionamento: String = "",
        informacoesGerais: String? = nil,
        endereco: EnderecoProjeto
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
        self.informacoesGerais = informacoesGerais
    }

}
@SQLiteTable("enderecosProjetos")
@Model
class EnderecoProjeto {
    @SQLiteColumn("idEnderecosProjetos")
    var id: Int
    var logradouro: String
    var numero: String?
    var complemento: String?
    var cidade: String?
    var bairro: String?
    var estado: String?
    var cep: String?
//    @Relationship(inverse: \Projeto.endereco) var projeto: Projeto?
    
    
    init(
        id: Int,
        logradouro: String,
        numero: String? = nil,
        complemento: String? = nil,
        cidade: String? = "Fortaleza",
        bairro: String? = nil,
        estado: String? = "CE",
        cep: String? = nil,
//        projeto: Projeto? = nil
    ) {
        self.id = id
        self.logradouro = logradouro
        self.numero = numero
        self.complemento = complemento
        self.cidade = cidade
        self.bairro = bairro
        self.estado = estado
        self.cep = cep
//        self.projeto = projeto
    }
}

