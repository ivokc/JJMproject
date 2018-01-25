//
//  ErrorCode.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

enum ErrorCode: String {
  
  case NETWORK_TIME_OUT = "0000"
  case NETWORK_FAILURE = "0001"
  case NETWORK_DOWNLOAD_FAILURE = "0002"
  
  case IMAGE_CACHE_NO_SUCH_IMAGE = "1000"
  case IMAGE_CACHE_TRANSFORM_TO_BASE64 = "1001"
  
  case DATA_STORE_FAILURE = "2000"
  
  case LOCATION_FAILURE = "3000"
  
  case HOT_UPDATE_FAILURE = "4000"
  case HOT_UPDATE_UNZIP_FAILURE = "4001"
  case HOT_UPDATE_PATCH_APPLY_FAILURE = "4002"
  case HOT_UPDATE_PATCH_FILE_IS_EMPTY_OR_INDEX_BUNDLE_IS_NOT_EXIST_FAILURE = "4003"

  case CAMERA_FAILURE = "5000"
  
}
