//
//  ContentViewModel.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza Deepty on 21/11/23.
//

import Foundation
import UIKit
import SwiftUI

enum SourceType: String, CaseIterable {
    
    case choosePhoto = "Choose Photo"
    case takePhoto = "Take Photo"
    
    var value: UIImagePickerController.SourceType {
        switch self {
        case .choosePhoto: return .photoLibrary
        case .takePhoto: return .camera
        }
    }
    
    var imageName: String {
        switch self {
        case .choosePhoto: return "photo"
        case .takePhoto: return "camera"
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var convertedText: String?
    @State var image = UIImage(systemName: "photo")!
    var conversionManager = ConversionManager()
    
    func convertToText(for image: UIImage) {
        conversionManager.convert(from: image) {[weak self] text in
            self?.convertedText = text
        }
    }
}

