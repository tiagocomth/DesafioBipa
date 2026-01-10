//
//  Node.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import Foundation

struct Node: Decodable, Identifiable {
    var id: UUID = UUID()
    var publicKey: String
    var alias: String
    var channels: Int
    var capacity: Int
    var firstSeen: Int
    var updatedAt: Int
    var city: LocalizedName?
    var country: LocalizedName?
    var isoCode: String?
    var subdivision: String?
    
    enum CodingKeys: String, CodingKey {
        case publicKey
        case alias
        case channels
        case capacity
        case firstSeen
        case updatedAt
        case city
        case country
        case isoCode = "iso_code"
        case subdivision
    }
}

extension Node {
    static var mockList: [Node] =
    [
        Node(
        publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
        alias: "ACINQ",
        channels: 1926,
        capacity: 37_059_276_927,
        firstSeen: 1_522_941_222,
        updatedAt: 1_767_977_106,
        city: nil,
        country: LocalizedName(
            de: "Vereinigte Staaten",
            en: "United States",
            es: "Estados Unidos",
            fr: "États Unis",
            ja: "アメリカ",
            ptBR: "EUA",
            ru: "США",
            zhCN: "美国"
        ),
        isoCode: "US",
        subdivision: nil
    ),
        Node(
        publicKey: "0217890e3aad8d35bc054f43acc00084b25229ecff0ab68debd82883ad65ee8266",
        alias: "1ML.com node ALPHA",
        channels: 1769,
        capacity: 770_977_945,
        firstSeen: 1_529_506_821,
        updatedAt: 1_767_975_864,
        city: LocalizedName(
            de: "New York City",
            en: "New York",
            es: "Nueva York",
            fr: "New York",
            ja: "ニューヨーク",
            ptBR: "Nova Iorque",
            ru: "Нью-Йорк",
            zhCN: nil
        ),
        country: LocalizedName(
            de: "Vereinigte Staaten",
            en: "United States",
            es: "Estados Unidos",
            fr: "États Unis",
            ja: "アメリカ",
            ptBR: "EUA",
            ru: "США",
            zhCN: "美国"
        ),
        isoCode: "US",
        subdivision: "{\"de\":\"New York\",\"en\":\"New York\",\"es\":\"Nueva York\",\"fr\":\"New York\",\"ja\":\"ニューヨーク州\",\"pt-BR\":\"Nova Iorque\",\"ru\":\"Нью-Йорк\",\"zh-CN\":\"纽约州\"}"
    ),
        Node(
        publicKey: "0242a4ae0c5bef18048fbecf995094b74bfb0f7391418d71ed394784373f41e4f3",
        alias: "CoinGate",
        channels: 1253,
        capacity: 1_501_893_573,
        firstSeen: 1_528_159_480,
        updatedAt: 1_767_976_910,
        city: LocalizedName(
            de: "Frankfurt am Main",
            en: "Frankfurt am Main",
            es: "Francfort",
            fr: "Francfort-sur-le-Main",
            ja: "フランクフルト・アム・マイン",
            ptBR: "Frankfurt am Main",
            ru: "Франкфурт",
            zhCN: "法兰克福"
        ),
        country: LocalizedName(
            de: "Deutschland",
            en: "Germany",
            es: "Alemania",
            fr: "Allemagne",
            ja: "ドイツ連邦共和国",
            ptBR: "Alemanha",
            ru: "Германия",
            zhCN: "德国"
        ),
        isoCode: "DE",
        subdivision: "{\"de\":\"Hessen\",\"en\":\"Hesse\",\"es\":\"Hessen\",\"fr\":\"Hesse\",\"ru\":\"Гессен\"}"
    )
    ]
}

struct LocalizedName: Codable {
    let de: String?
    let en: String?
    let es: String?
    let fr: String?
    let ja: String?
    let ptBR: String?
    let ru: String?
    let zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de
        case en
        case es
        case fr
        case ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}
