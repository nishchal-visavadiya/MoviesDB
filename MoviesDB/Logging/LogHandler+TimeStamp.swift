//
//  LogHandler+TimeStamp.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

extension LogHandler {
    
    func localForamttedTimeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone.current
        let timestamp = dateFormatter.string(from: Date())
        return timestamp
    }
    
    func localForamttedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        let timestamp = dateFormatter.string(from: Date())
        return timestamp
    }
}
