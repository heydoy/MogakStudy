//
//  ViewModelType.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation

protocol ViewModelType: AnyObject {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
} 
