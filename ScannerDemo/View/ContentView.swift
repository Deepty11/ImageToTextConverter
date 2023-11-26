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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                VStack(spacing: 10) {
                    Group {
                        ImageView(image: viewModel.image)
                        TextView(text: viewModel.convertedText)
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                
                HStack {
                    ForEach(SourceType.allCases, id: \.rawValue) { source in
                        Button(action: {
                            self.showPhotoLibrary = true
                            sourceType = source
                        }, label: {
                            ButtonView(imageName: source.imageName,
                                       title: source.rawValue)
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
                ImagePicker(sourceType: sourceType.value, selectedImage: $viewModel.image)
            }
            .onChange(of: viewModel.image) {
                viewModel.convertToText(for: viewModel.image)
            }
            .navigationTitle("Scan Image")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
