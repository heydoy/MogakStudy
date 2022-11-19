//
//  UIViewController+Extension.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/20.
//

import SwiftUI

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
    
    dynamic func x() {
            print("x")
        }
    
    @_dynamicReplacement(for: x())
        func y() {
            print("y - replaced dynamically")
        }
}
#endif
