//
//  NotesManager.swift
//  AVP Dashboard Visualizer
//
//  Created by khushi raju on 11/14/24.
//

import Foundation
import SwiftUI

struct Note: Identifiable, Codable {
    let id: UUID
    let imageData: Data
    let noteText: String
    let date: Date
}

class NotesManager: ObservableObject {
    @Published var notes: [Note] = []

    private let storageKey = "SavedNotes"

    init() {
        loadNotes()
    }

    func addNote(image: UIImage, text: String) {
        guard let imageData = image.pngData() else { return }
        let newNote = Note(id: UUID(), imageData: imageData, noteText: text, date: Date())
        notes.append(newNote)
        saveNotes()
    }

    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        saveNotes()
    }

    private func saveNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func loadNotes() {
        if let savedData = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Note].self, from: savedData) {
            notes = decoded
        }
    }
}
