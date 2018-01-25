//
//  CameraUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2018/1/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

import UIKit

//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaType __TVOS_PROHIBITED;      // an NSString (UTI, i.e. kUTTypeImage)
//UIKIT_EXTERN NSString *const UIImagePickerControllerOriginalImage __TVOS_PROHIBITED;  // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerEditedImage __TVOS_PROHIBITED;    // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerCropRect __TVOS_PROHIBITED;       // an NSValue (CGRect)
//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaURL __TVOS_PROHIBITED;       // an NSURL
//UIKIT_EXTERN NSString *const UIImagePickerControllerReferenceURL        NS_DEPRECATED_IOS(4_1, 11_0, "Replace with public API: UIImagePickerControllerPHAsset") __TVOS_PROHIBITED;  // an NSURL that references an asset in the AssetsLibrary framework
//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaMetadata       NS_AVAILABLE_IOS(4_1) __TVOS_PROHIBITED;  // an NSDictionary containing metadata from a captured photo
//UIKIT_EXTERN NSString *const UIImagePickerControllerLivePhoto NS_AVAILABLE_IOS(9_1) __TVOS_PROHIBITED;  // a PHLivePhoto
//UIKIT_EXTERN NSString *const UIImagePickerControllerPHAsset NS_AVAILABLE_IOS(11_0) __TVOS_PROHIBITED;  // a PHAsset
//UIKIT_EXTERN NSString *const UIImagePickerControllerImageURL NS_AVAILABLE_IOS(11_0) __TVOS_PROHIBITED;  // an NSURL

typealias UIImagePickerConfirmHandler = (Any) -> Void
typealias UIImagePickerCancelHandler = () -> Void

class CameraUtility: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  private lazy var dataUtility: DataUtility = {
    return DataUtility()
  }()
  
  private lazy var imagePickerController: UIImagePickerController = {
    let imagePickerController = UIImagePickerController()
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      imagePickerController.sourceType = .camera
    } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      imagePickerController.sourceType = .photoLibrary
    } else if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
      imagePickerController.sourceType = .savedPhotosAlbum
    }
    imagePickerController.delegate = self
    return imagePickerController
  }()
  
  var config: [String: Float]?
  var confirmHandler: UIImagePickerConfirmHandler?
  var cancelHandler: UIImagePickerCancelHandler?
  
  func openCamera(config: [String: Float], context: UIViewController, confirmHandler: @escaping UIImagePickerConfirmHandler, cancelHandler: @escaping UIImagePickerCancelHandler) {
    self.config = config
    self.confirmHandler = confirmHandler
    self.cancelHandler = cancelHandler
    context.present(imagePickerController, animated: true, completion: nil)
  }
  
  func close() {
    imagePickerController.dismiss(animated: true, completion: nil)
    confirmHandler = nil
    cancelHandler = nil
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let confirmHandler = confirmHandler {
      if let config = config {
        if let quality = config["quality"] {
          guard quality != 1.0 else {
            confirmHandler(dataUtility.imageToBase64String(image: info[UIImagePickerControllerOriginalImage]! as! UIImage)!)
            close()
            return
          }
          let imageData = UIImageJPEGRepresentation(info[UIImagePickerControllerOriginalImage] as! UIImage, CGFloat(quality))!
          confirmHandler(dataUtility.imageToBase64String(image: UIImage(data: imageData)!)!)
        }
      }
    }
    close()
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    if let cancelHandler = cancelHandler {
      cancelHandler()
      close()
    }
  }
  
  deinit {
    print("===== CameraUtility deinit =====")
  }

}
