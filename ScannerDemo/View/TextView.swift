//
//  TextView.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza on 26/11/23.
//

import SwiftUI

struct TextView: View {
    var text: String?
    var body: some View {
        Text(text ?? "No text to show")
            .font(.system(.body))
            .foregroundStyle(text != nil ? .primary : .secondary)
            .frame(width: 200, height: 300)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    TextView()
}
