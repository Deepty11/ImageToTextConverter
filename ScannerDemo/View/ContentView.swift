//
//  ContentView.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza Deepty on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var showPhotoLibrary: Bool = false
    @State var sourceType: SourceType = .choosePhoto
    @State var image = UIImage()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 10) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 300)
                        .foregroundStyle(Color.secondary)
                        .padding(.leading, 8)
                    
                    Text(viewModel.convertedText ?? "No text to show")
                        .font(.system(.body))
                        .foregroundStyle(viewModel.convertedText != nil ? .primary : .secondary)
                        .frame(width: 100, height: 300)
                        .multilineTextAlignment(.leading)
                }
                
                HStack {
                    ForEach(SourceType.allCases, id: \.rawValue) { source in
                        Button(action: {
                            self.showPhotoLibrary = true
                            sourceType = source
                        }, label: {
                            Text(source.rawValue)
                        })
                        .padding(10)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    }
                }
                
            }
            .padding()
            .sheet(isPresented: $showPhotoLibrary) {
                ImagePicker(sourceType: sourceType.value, selectedImage: self.$image)
            }
            .onChange(of: image) {
                viewModel.convertToText(for: image)
            }
            .navigationTitle("Scan Image")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
