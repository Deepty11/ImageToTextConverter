//
//  ConversionManager.swift
//  ScannerDemo
//
//  Created by Rehnuma Reza Deepty on 20/11/23.
//

import Foundation
import Vision
import UIKit

class ConversionManager {
    func convert(from image: UIImage, completion: ((String) -> Void)?) {
        guard let cgiImage = image.cgImage else { return }
        
        let handler = VNImageRequestHandler(cgImage: cgiImage, options: [:])
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation], error == nil
            else { return }
            
            let text = observations.compactMap { observation in
                observation.topCandidates(1).first?.string
            }.joined(separator: "\n")
            
            completion?(text)
            
        }
        
        try? handler.perform([request])
    }
}
