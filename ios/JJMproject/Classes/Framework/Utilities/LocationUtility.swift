//
//  LocationUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

/////位置语义化结果的属性，该定位点周围的poi列表信息
//@property(nonatomic, retain, readonly) NSArray<BMKLocationPoi *> *poiList;

class LocationUtility: NSObject {

  func requestLocation(block: @escaping LocationCompletionBlock) {
    // TODO 自定义 location 类, 防止字段变化
    let delegate = UIApplication.shared.delegate as! AppDelegate
    delegate.requestLocation(block: block)
  }
  
  func requestLocationInfo(block: @escaping ([String: Any], Error?) -> ()) {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    delegate.requestLocation { (locationInfo, locationNetworkState, error) in
      var locationMap = [String: Any]()
      
      guard error == nil else {
        block(locationMap, error)
        return
      }
      
      if let locationInfo = locationInfo {
        if let location = locationInfo.location {
          locationMap["latitude"] = location.coordinate.latitude // 维度
          locationMap["longitude"] = location.coordinate.longitude // 经度
          locationMap["altitude"] = location.altitude // 海拔
          locationMap["horizontalAccuracy"] = location.horizontalAccuracy // 水平精度
          locationMap["verticalAccuracy"] = location.verticalAccuracy // 垂直精度
          locationMap["course"] = location.course // 进程
          locationMap["speed"] = location.speed // 速度
          locationMap["timestamp"] = location.timestamp.timeIntervalSinceNow // 时间戳
          locationMap["floor"] = location.floor // 楼层
        }
        if let rgcData = locationInfo.rgcData {
          locationMap["country"] = rgcData.country // 国家名字属性
          locationMap["countryCode"] = rgcData.countryCode // 国家编码属性
          locationMap["province"] = rgcData.province // 省份名字属性
          locationMap["city"] = rgcData.city // 城市名字属性
          locationMap["district"] = rgcData.district // 区名字属性
          locationMap["street"] = rgcData.street // 街道名字属性
          locationMap["streetNumber"] = rgcData.streetNumber // 街道号码属性
          locationMap["cityCode"] = rgcData.cityCode // 城市编码属性
          locationMap["adCode"] = rgcData.adCode // 行政区划编码属性
          locationMap["locationDescribe"] = rgcData.locationDescribe // 位置语义化结果的定位点在什么地方周围的描述信息
        }
        
        block(locationMap, nil)
      }
    }
  }
  
  func stopLocation() {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    delegate.stopLocation()
  }
  
}
