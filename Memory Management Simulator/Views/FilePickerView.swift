//
//  FilePickerView.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 2/13/23.
//

import SwiftUI

struct FilePickerView: View {
    
    // MARK: - Properties
    
    @State private var isPresentingDocumentPicker = false

        var body: some View {
            Button(action: {
                self.isPresentingDocumentPicker = true
            }) {
                Text("Upload here")
            }
            .sheet(isPresented: $isPresentingDocumentPicker) {
                DocumentPickerView(isPresented: self.$isPresentingDocumentPicker)
            }
        }
    }

    struct DocumentPickerView: UIViewControllerRepresentable {
        // MARK: - Properties
        
        @Binding var isPresented: Bool

        func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPickerView>) -> UIDocumentPickerViewController {
            let picker = UIDocumentPickerViewController(documentTypes: ["public.text"], in: .import)
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPickerView>) {
            
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UIDocumentPickerDelegate {
            let parent: DocumentPickerView

            init(_ parent: DocumentPickerView) {
                self.parent = parent
            }

            func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
                // Shared data
                @EnvironmentObject var data: Parameters
                
                // handle the selected file(s) here
                
                // Testing the data transfer
                //data.placementPolicy = 54321
                
                for url in urls {
                        do {
                            let text = try String(contentsOf: url)
                            print(text)
                        } catch {
                            print("Failed to read contents of the file at \(url.path)")
                        }
                    }
                parent.isPresented = false
            }

            func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
                parent.isPresented = false
            }
        }
    }

struct FilePickerView_Previews: PreviewProvider {
    static var previews: some View {
        FilePickerView()
    }
}
