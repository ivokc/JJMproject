//
//  DataUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class DataUtility: NSObject {
  
  func base64StringToData(dataString: String) -> Data {
    return Data()
//    return dataString.asData()
  }
  
  func dataToBase64String(data: Data) -> String {
    return NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
  }
  
  func imageToBase64String(image: UIImage) -> String? {
    if let imageData = UIImagePNGRepresentation(image) {
      return imageData.base64EncodedString(options: .lineLength64Characters)
    }
    return nil
  }

  func base64StringToImage(imageString: String) -> UIImage? {
    if let imageData = Data(base64Encoded: imageString, options: .ignoreUnknownCharacters) {
      return UIImage(data: imageData)
    }
    return nil
  }
  
  func stringToFloat(_ str: String) -> CGFloat {
    let string = str
    var cgFloat: CGFloat = 0
    if let doubleValue = Double(string) {
      cgFloat = CGFloat(doubleValue)
    }
    return cgFloat
  }
  
  func stringToInt(_ str: String) -> Int {
    let string = str
    var int: Int?
    if let doubleValue = Int(string) {
      int = Int(doubleValue)
    }
    if int == nil {
      return 0
    }
    return int!
  }
  
}
