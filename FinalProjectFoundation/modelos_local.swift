//
//  modelos.swift
//  FinalProjectFoundation
//
//  Created by found on 02/06/26.
//

import Foundation
import SwiftData
import SwiftDataSQLite

@SQLiteTable("locais")
@Model
class Local: Identifiable {
    @SQLiteColumn("idLocal")
    var id: Int? = nil
    var nomeLocal: String
    var imagemPrincipal: Data
    var recursos: String
    var descricaoLocal: String
    var bairroLocal: String
    var horarioFuncionamento: String
    var diasFuncionamento: String
    @SQLiteColumn("idEnderecoLocal")
    @Relationship var endereco: Endereco_local
    
    init(
        id: Int? = nil,
        nomeLocal: String,
        imagemPrincipal: Data,
        recursos: String,
        descricaoLocal: String,
        bairroLocal: String,
        horarioFuncionamento: String,
        diasFuncionamento: String,
        endereco: Endereco_local
        
        
    ){
        self.id = id
        self.nomeLocal = nomeLocal
        self.recursos = recursos
        self.descricaoLocal = descricaoLocal
        self.bairroLocal = bairroLocal
        self.horarioFuncionamento = horarioFuncionamento
        self.diasFuncionamento = diasFuncionamento
        self.imagemPrincipal = imagemPrincipal
        self.endereco = endereco
        
    }
}


@SQLiteTable("enderecosLocais")
@Model
class Endereco_local: Identifiable {
    @SQLiteColumn("idEnderecos")
    var id: Int?
    var logradouro: String
    var numero: String?
    var complemento: String?
    var bairro: String
    var cidade: String
    var estado: String
    var cep: String
    //@Relationship(inverse:\ Local.endereco) var local: Local?
    
    
    init(
            id: Int? = nil,
            logradouro: String,
            numero: String?,
            complemento: String?,
            bairro: String,
            cidade: String,
            estado: String,
            cep: String
        ) {
            self.id = id
            self.logradouro = logradouro
            self.numero = numero
            self.complemento = complemento
            self.bairro = bairro
            self.cidade = cidade
            self.estado = estado
            self.cep = cep
            
        }
    }
    

    
