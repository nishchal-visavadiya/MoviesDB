//
//  Task+Delay.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation

func delay(by delay: Duration) async {
    try? await Task.sleep(for: delay)
}
