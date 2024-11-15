//
//  Cursor.swift
//  AVP Dashboard Visualizer
//
//  Created by khushi raju on 11/14/24.
//

import SwiftUI

struct BlueCursorView: View {
    @ObservedObject var gazeTracker: GazeTracker

    var body: some View {
        Circle()
            .fill(Color.blue.opacity(0.7))
            .frame(width: 20, height: 20)
            .position(gazeTracker.gazePosition)
            .animation(.easeInOut(duration: 0.1), value: gazeTracker.gazePosition)
    }
}
