//
//  main.swift
//  espadaNaForja
//
//  Created by TIAGO MENDOZA RIBEIRO DE OLIVEIRA on 14/11/25.
//

import Foundation

let espadasNaForja: [String: (raridade: String, preco: Int)] = [
    "Lamina do Iniciante": ("Comum", 50),
    "Espada Epica": ("Epica", 500),
    "Corte Mitico": ("Mitica", 1500),
    "Gume Lendario": ("Lendaria", 3000)
]

var ouroDoAventureiro: Int = 1000
var inventarioDeEspadas: [String] = []

func mostrarInventario() {
    print("\n--- 🎒 Inventário de Espadas ---")
    if inventarioDeEspadas.isEmpty {
        print("Vazio.")
    } else {
        for espada in inventarioDeEspadas {
            print("- \(espada)")
        }
    }
    print("--------------------------------")
}

var continuarNoMenu = true

while continuarNoMenu {
    print("\n==============================================")
    print("  🛡️ APPLE ACADEMY: FORJA DE ESPADAS 🛡️ ")
    print("==============================================")
    print("Seu Ouro: \(ouroDoAventureiro)")
    print("1. Ver Espadas")
    print("2. Forjar uma Espada")
    print("3. Ver Meu Inventário")
    print("4. Sair")
    print("----------------------------------------------")
    print("Escolha uma opção (1-4): ", terminator: "")

    guard let entrada = readLine(), let escolha = Int(entrada) else {
        print("\n❌ Entrada inválida. Tente novamente.")
        continue
    }

    switch escolha {
    case 1:
        print("\n--- 🔨 Espadas em Forja ---")
        for (nome, detalhes) in espadasNaForja {
            print("* \(nome) (\(detalhes.raridade)) - \(detalhes.preco) Ouro")
        }
        print("---------------------------")
        
    case 2:
        print("\n--- ⚔️ Forjar Espada ---")
        for (nome, detalhes) in espadasNaForja {
            print("* \(nome) - \(detalhes.preco) Ouro")
        }
        
        print("Digite o NOME EXATO da espada: ", terminator: "")
        
        guard let nomeEspada = readLine() else {
            print("❌ Nome inválido.")
            break
        }
        
        if let detalhes = espadasNaForja[nomeEspada] {
            let preco = detalhes.preco
            let raridade = detalhes.raridade

            if ouroDoAventureiro >= preco {
                // Modificando as variáveis globais DENTRO do switch
                ouroDoAventureiro -= preco
                inventarioDeEspadas.append(nomeEspada)
                
                print("\n🎉 Compra OK: \(nomeEspada) (\(raridade)) adicionada!")
                print("Ouro restante: \(ouroDoAventureiro)")
            } else {
                print("\n💰 Falha: Ouro insuficiente. Precisa de \(preco)!")
            }
        } else {
            print("\n🚫 Espada '\(nomeEspada)' não existe na forja.")
        }
        
    case 3:
        mostrarInventario()

    case 4:
        print("\nO Ferreiro João se despede. Volte sempre!")
        continuarNoMenu = false

    default:
        print("\n❌ Opção fora do menu (1-4).")
    }
}

