//
//  Log.swift
//  PickerView
//
//  Created by 402-23 on 24/11/2018.
//  Copyright © 2018 402-23. All rights reserved.
//

import Foundation

func dp(_ debug: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
    #if true
    var filename: NSString = file as NSString
    filename = filename.lastPathComponent as NSString
    //Swift.print("파일: \(filename), 라인: \(line), 함수: \(function) \n\(debug)")
    Swift.print("파일: \(filename), 라인: \(line) :: \(debug)")
    #endif
}
