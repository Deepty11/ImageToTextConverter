//
//  ImageView.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza on 26/11/23.
//

import SwiftUI
import UIKit

struct ImageView: View {
    var image = UIImage(systemName: "photo")!
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.secondary)
            .padding(.leading, 8)
    }
}

#Preview {
    ImageView()
        .previewLayout(.sizeThatFits)
}
