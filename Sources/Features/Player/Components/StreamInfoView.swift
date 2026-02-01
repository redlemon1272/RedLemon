//
//  StreamInfoView.swift
//  RedLemon
//
//  Created for Stream Information Display
//

import SwiftUI

struct StreamInfoView: View {
    let streamTitle: String
    let url: String
    let quality: String
    let source: String
    let hash: String
    
    // Binding to close the view
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Text("Stream Information")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isPresented = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            
            // Content
            VStack(alignment: .leading, spacing: 12) {
                StreamInfoRow(label: "Title", value: streamTitle)
                StreamInfoRow(label: "Quality", value: "\(quality) - \(source)")
                StreamInfoRow(label: "Source URL", value: url)
                StreamInfoRow(label: "Hash", value: hash)
            }
            .padding(.horizontal, 24)
            
            // Copy Debug Info Button
            Button(action: {
                let debugString = """
                Stream Info:
                Title: \(streamTitle)
                Quality: \(quality)
                Source: \(source)
                URL: \(url)
                Hash: \(hash)
                """
                
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(debugString, forType: .string)
            }) {
                HStack {
                    Image(systemName: "doc.on.doc")
                    Text("Copy Stream Info")
                }
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.8))
                .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 20)
        }
        .frame(maxWidth: 500)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
        .padding()
    }
}

struct StreamInfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.system(size: 13)) // Monospace for technical data? Maybe just for hash/url
                .foregroundColor(.primary)
                .lineLimit(3)
                .textSelection(.enabled) // Allow copying text
        }
    }
}
