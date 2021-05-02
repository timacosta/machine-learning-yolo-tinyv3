//
//  MLModel.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 27/4/21.
//

import Foundation
import CoreML
import AVFoundation
import Vision

class YOLOv3Model {
  
  private var detectionOverlay: CALayer! = nil
  private var requests = [VNRequest]()
  
  //setup model
  func setupModel() -> NSError?{
    
    let error: NSError! = nil
    
    guard let modelURL = Bundle.main.url(forResource: "YOLOv3Tiny", withExtension: "mlmodel") else {
      return NSError(domain: "MLModel", code: -1, userInfo: [NSLocalizedDescriptionKey: "Model file missing or not found"])
    }
    
    do {
      let yolov3Model = try VNCoreMLModel(for: MLModel(contentsOf: modelURL))
      let objectRecognizition = VNCoreMLRequest(model: yolov3Model, completionHandler: { (request, error) in
        DispatchQueue.main.async {
          if let results = request.results {
            self.drawVisionRequestResults(results)
          }
        }
      })
      self.requests = [objectRecognizition]
      
    } catch let error as NSError {
      print("Model loading went wrong: \(error)")
      
    }
    
    return error
    
  }
  
  func drawVisionRequestResults(_ results: [Any]) {
    CATransaction.begin()
    CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
    detectionOverlay.sublayers = nil // remove all the old recognized objects
    for observation in results where observation is VNRecognizedObjectObservation {
      guard let objectObservation = observation as? VNRecognizedObjectObservation else {
        continue
      }
      //select only the label with the highest confidence
      let topLabelObservation = objectObservation.labels[0]
      let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, 100, 100)
      //let shapeLayer = self.cre
      
    }
  }
  
}

