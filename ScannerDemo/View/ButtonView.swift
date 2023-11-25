//
//  ButtonView.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza on 26/11/23.
//

import SwiftUI

struct ButtonView: View {
    var imageName: String = ""
    var title: String = ""
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

#Preview {
    ButtonView()
}
