//
//  InputsView.swift
//  Extractor
//
//  Created by Yunfang Li on 2/16/23.
//

import SwiftUI

struct InputsView: View {
    @Environment(\.managedObjectContext) private var contentView
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.modifiedTime, ascending: true)],
        animation: .default)
    private var books: FetchedResults<Book>
    @State private var isImporting = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        PDFKitView(url: book.url!)
                    } label: {
                        Text(book.name!)
                    }
                }
                .onDelete(perform: DeleteBooks)
            }
            .navigationTitle("Inputs")
            .toolbar {
                Button {
                    isImporting = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
            .fileImporter(isPresented: $isImporting, allowedContentTypes: [.pdf], allowsMultipleSelection: true) { result in
                do {
                    let urls = try result.get()
                    AddBooks(urls)
                } catch {
                    print("Unexpect errors: \(error)")
                }
            }
        }
    }
    
    private func AddBooks(_ urls: [URL]) {
        withAnimation {
            for bookUrl in urls {
                let newBook = Book(context: contentView)
                newBook.url = bookUrl
                newBook.name = bookUrl.lastPathComponent
                newBook.addedTime = Date()
                newBook.modifiedTime = newBook.addedTime
                newBook.readPosition = BookPosition(context: contentView)
            }
            
            do {
                try contentView.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func DeleteBooks(offsets: IndexSet) {
        withAnimation {
            offsets.map{ books[$0] }.forEach { book in
                if let readPos = book.readPosition {
                    contentView.delete(readPos)
                }
                contentView.delete(book)
            }
            
            do {
                try contentView.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct InputsView_Previews: PreviewProvider {
    static var previews: some View {
        InputsView()
    }
}
