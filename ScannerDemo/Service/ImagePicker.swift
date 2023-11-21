//
//  ImagePicker.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza Deepty on 21/11/23.
//

import Foundation
import UIKit
import SwiftUI

class ImagePickerView: NSObject, UIViewControllerRepresentable {
    var picker = UIImagePickerController()
    weak var delegate: ImagePickerDelegate!
    
    override init() {
        super.init()
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.cameraCaptureMode = .photo
    }
    
    func showPromptForImageSelection(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        picker.sourceType = sourceType
        return picker
    }
}

extension ImagePickerView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let url = info[.mediaURL] as? URL else { return }
        delegate.didSelectedImage(with: url)
    }
    
}

protocol ImagePickerDelegate: AnyObject {
    func didSelectedImage(with url: URL)
}
