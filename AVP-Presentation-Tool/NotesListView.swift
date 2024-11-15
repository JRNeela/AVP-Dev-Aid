//
//  NotesListView.swift
//  AVP Dashboard Visualizer
//
//  Created by khushi raju on 11/14/24.
//

import SwiftUI

struct NotesListView: View {
    @ObservedObject var notesManager: NotesManager

    var body: some View {
        NavigationView {
            List {
                ForEach(notesManager.notes) { note in
                    HStack {
                        if let uiImage = UIImage(data: note.imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(8)
                        }

                        VStack(alignment: .leading) {
                            Text(note.noteText)
                                .font(.body)
                            Text(note.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: notesManager.deleteNote)
            }
            .navigationTitle("My Notes")
            .toolbar {
                EditButton()
            }
        }
    }
}
