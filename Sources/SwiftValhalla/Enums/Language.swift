//
//  Language.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// The language of the narration instructions based on the IETF BCP 47 language tag string. If no language is specified or the specified language is unsupported, United States-based English (en-US) is used.
public enum Language: String, Codable {
    
    case bulgarian = "bg-BG"
    case catalan = "ca-ES"
    case czech = "cs-CZ"
    case danish = "da-DK"
    case german = "de-DE"
    case greek = "el-GR"
    case englishUnitedStates = "en-US"
    case englishUnitedKingdom = "en-GB"
    case englishPirate = "en-US-x-pirate"
    case spanish = "es-ES"
    case estonian = "et-EE"
    case finnish = "fi-FI"
    case french = "fr-FR"
    case hindi = "hi-IN"
    case hungarian = "hu-HU"
    case italian = "it-IT"
    case japanese = "ja-JP"
    case bokmalNorwegian = "nb-NO"
    case dutch = "nl-NL"
    case polish = "pl-PL"
    case portuguesePortugal = "pt-PT"
    case portugueseBrazil = "pt-BR"
    case romanian = "ro-RO"
    case russian = "ru-RU"
    case slovak = "sk-SK"
    case slovenian = "sl-SI"
    case swedish = "sv-SE"
    case turkish = "tr-TR"
    case ukrainian = "uk-UA"
    
}
