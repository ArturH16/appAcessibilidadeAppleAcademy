//
//  modelos.swift
//  FinalProjectFoundation
//
//  Created by found on 02/06/26.
//

import Foundation
import SwiftData
import SwiftDataSQLite

//@SQLiteTable("locais")
@Model
class Local: Identifiable {
    var idLocal: Int? = nil
    var nomeLocal: String
    var imagemPrincipal: Data
    var recursos: [String]
    var isFavorite: Int
    var descricaoLocal: String
    var bairroLocal: String
    var horarioFuncionamento: String
    var diasFuncionamento: String
    @Relationship var endereco: Endereco_local?
    
    init(
        idLocal: Int? = nil,
        nomeLocal: String,
        imagemPrincipal: Data,
        recursos: [String],
        isFavorite: Int,
        descricaoLocal: String,
        bairroLocal: String,
        horarioFuncionamento: String,
        diasFuncionamento: String
        
        
    ){
        self.idLocal = idLocal
        self.nomeLocal = nomeLocal
        self.recursos = recursos
        self.isFavorite = isFavorite
        self.descricaoLocal = descricaoLocal
        self.bairroLocal = bairroLocal
        self.horarioFuncionamento = horarioFuncionamento
        self.diasFuncionamento = diasFuncionamento
        self.imagemPrincipal = imagemPrincipal
        
    }
}


//@SQLiteTable("enderecosLocais")
@Model
class Endereco_local: Identifiable {
    var idEnderecos: Int?
    var logradouro: String?
    var numero: String?
    var complemento: String
    var bairro: String?
    var cidade: String?
    var estado: String?
    var cep: String?
    @Relationship(inverse:\ Local.endereco) var local: Local?
    
    
    init(
            idEnderecos: Int? = nil,
            logradouro: String = "",
            numero: String = "",
            complemento: String = "",
            bairro: String = "",
            cidade: String = "",
            estado: String = "",
            cep: String = ""
        ) {
            self.idEnderecos = idEnderecos
            self.logradouro = logradouro
            self.numero = numero
            self.complemento = complemento
            self.bairro = bairro
            self.cidade = cidade
            self.estado = estado
            self.cep = cep
            
        }
    }
    

    
