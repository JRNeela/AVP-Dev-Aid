//
//  NotesInputView.swift
//  AVP Dashboard Visualizer
//
//  Created by khushi raju on 11/14/24.
//

import SwiftUI

struct NoteInputView: View {
    @ObservedObject var notesManager: NotesManager
    let image: UIImage
    @Binding var isPresented: Bool

    @State private var noteText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Add a Note")
                .font(.headline)

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(10)
                .shadow(radius: 5)

            TextEditor(text: $noteText)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding()

            HStack {
                Button(action: {
                    isPresented = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }

                Button(action: {
                    notesManager.addNote(image: image, text: noteText)
                    isPresented = false
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .disabled(noteText.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
        .padding()
    }
}
