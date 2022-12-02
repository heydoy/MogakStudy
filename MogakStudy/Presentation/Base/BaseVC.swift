//
//  BaseVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/14.
//

import UIKit
import MogakStudyUIFramework

/// 베이스 뷰 컨트롤러
/// - loadView() 메서드를 오버라이드한 후 view를 커스텀 뷰로 교체해줄 수 있다.
class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setNavigationBar()

    }
    /// Delegate, Register, AddTarget 등
    func configure() {}
    
    /// 네비게이션 바 설정
    /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .msColor.black
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.msColor.black,
            .font: UIFont.Title3_M14
        ]
        
        let customBackButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped) )
        
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc
    func backButtonTapped(_ sender: UIBarButtonItem) {
        if self == navigationController?.viewControllers.first {
            dismiss(animated: true)
        }  else {
            navigationController?.popViewController(animated: true)
        }
    }
}
