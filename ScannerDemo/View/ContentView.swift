//
//  ContentView.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza Deepty on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.convertedText ?? "No text to show")
                    .font(.system(.body))
                    .foregroundStyle(viewModel.convertedText != nil ? .primary : .secondary)
                HStack {
                    ForEach(SourceType.allCases, id: \.rawValue) { source in
                        Button(action: {
                            
                            viewModel.getPrompt(from: source)
                        }, label: {
                            Text("Choose Photo")
                        })
                        .padding(10)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    }
                    Group {
                        Button(action: {
                            viewModel.getPrompt(from: .choosePhoto)
                        }, label: {
                            Text("Choose Photo")
                        })
                        Button(action: {
                            viewModel.getPrompt(from: .takePhoto)
                        }, label: {
                            Text("Take Photo")
                        })
                    }
                    .padding(10)
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    
                    
                }
                
                
            }
            .padding()
            .onAppear {
                
            }
            .navigationTitle("Scan Image")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
