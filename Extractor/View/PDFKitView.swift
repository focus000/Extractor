//
//  PDFKitView.swift
//  Extractor
//
//  Created by Yunfang Li on 2/19/23.
//

import SwiftUI
import PDFKit

struct PDFKitView: View {
    let url: URL
    var body: some View {
        PDFKitRepresentedView(url: self.url)
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()
        guard url.startAccessingSecurityScopedResource() else {
            // handle error
            fatalError("Cannot access \(url)")
        }
        defer { url.stopAccessingSecurityScopedResource() }
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        // empty
    }
}

struct PDFKitView_Previews: PreviewProvider {
    static var previews: some View {
        PDFKitView(url: URL(filePath: "/Users/yunfangli/Downloads/2302.00923.pdf"))
    }
}
