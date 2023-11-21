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
}

class ContentViewModel {
    @State var selectedImageURL: URL?
    @State var convertedText: String?
    var conversionManager = ConversionManager()
    var imagePicker = ImagePicker()
    
    func getPrompt(from option: SourceType) -> UIImagePickerController {
        return imagePicker.showPromptForImageSelection(sourceType: option == .choosePhoto ? .photoLibrary : .camera)
    }
    
    func convertToText() {
        guard let selectedImageURL, let image = UIImage(contentsOfFile: selectedImageURL.absoluteString) else {
            return
        }
        conversionManager.convert(from: image) {[weak self] in
            self?.convertedText = $0
        }
    }
}

extension ContentViewModel: ImagePickerDelegate {
    func didSelectedImage(with url: URL) {
        selectedImageURL = url
    }
    
}


