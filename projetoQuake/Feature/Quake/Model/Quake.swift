//
//  Quake.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 21/06/22.
//

import SwiftUI
import OSLog

// A struct encapsulating the properties of a Quake.
struct Quake: Decodable {

    // MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case place
        case time
        case code
    }
    
    let magnitude: Float   // 1.9
    let place: String      // "21km ENE of Honaunau-Napoopoo, Hawaii"
    let time: Double       // 1539187727610
    let code: String       // "70643082"
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let rawMagnitude = try? values.decode(Float.self, forKey: .magnitude)
//        let rawPlace = try? values.decode(String.self, forKey: .place)
//        let rawTime = try? values.decode(Double.self, forKey: .time)
//        let rawCode = try? values.decode(String.self, forKey: .code)
//
//        // Ignore earthquakes with missing data.
//        guard let magntiude = rawMagnitude,
//              let place = rawPlace,
//              let time = rawTime,
//              let code = rawCode
//        else {
//            let values = "code = \(rawCode?.description ?? "nil"), "
//            + "mag = \(rawMagnitude?.description ?? "nil"), "
//            + "place = \(rawPlace?.description ?? "nil"), "
//            + "time = \(rawTime?.description ?? "nil")"
//
//            let logger = Logger(subsystem: "com.example.apple-samplecode.Earthquakes", category: "parsing")
//            logger.debug("Ignored: \(values)")
//
//            throw QuakeError.missingData
//        }
//
//        self.magnitude = magntiude
//        self.place = place
//        self.time = time
//        self.code = code
//    }
//
//    // The keys must have the same name as the attributes of the Quake entity.
//    var dictionaryValue: [String: Any] {
//        [
//            "magnitude": magnitude,
//            "place": place,
//            "time": Date(timeIntervalSince1970: TimeInterval(time) / 1000),
//            "code": code
//        ]
//    }
}

extension Quake {
    
    /// The color which corresponds with the quake's magnitude.
    var color: Color {
        switch magnitude {
        case 0..<1:
            return .green
        case 1..<2:
            return .yellow
        case 2..<3:
            return .orange
        case 3..<5:
            return .red
        case 5..<Float.greatestFiniteMagnitude:
            return .init(red: 0.8, green: 0.2, blue: 0.7)
        default:
            return .gray
        }
    }
    
//    /// An earthquake for use with canvas previews.
//    static var preview: Quake {
//        let quakes = Quake.makePreviews(count: 1)
//        return quakes[0]
//    }
//
//    @discardableResult
//    static func makePreviews(count: Int) -> [Quake] {
//        var quakes = [Quake]()
//        let viewContext = QuakesProvider.preview.container.viewContext
//        for index in 0..<count {
//            let quake = Quake(context: viewContext)
//            quake.code = UUID().uuidString
//            quake.time = Date().addingTimeInterval(Double(index) * -300)
//            quake.magnitude = .random(in: -1.1...10.0)
//            quake.place = "15km SSW of Cupertino, CA"
//            quakes.append(quake)
//        }
//        return quakes
//    }
}
extension Quake {
    
    static var dummyData: [Quake] {
        [
            .init(magnitude: 1.2,
                  place: "15km SSW of Cupertino, CA",
                  time: 1539187727610,
                  code: "70643082")
        ]
    }
}
