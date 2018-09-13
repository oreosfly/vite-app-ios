//
//  SystemViewController.swift
//  Vite
//
//  Created by Water on 2018/9/12.
//  Copyright © 2018年 vite labs. All rights reserved.
//

import UIKit
import Eureka
import SafariServices

struct Preferences: Codable {
    
}

enum NotificationChanged {
    case state(isEnabled: Bool)
    case preferences(Preferences)
}

class SystemViewController: FormViewController {

    var didChange: ((_ change: NotificationChanged) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        self._setupView()
    }

    lazy var logoutBtn: UIButton = {
        let logoutBtn = UIButton()
        logoutBtn.setTitle("退出并切换钱包", for: .normal)
        logoutBtn.titleLabel?.adjustsFontSizeToFitWidth  = true
        logoutBtn.setTitleColor(.black, for: .normal)
        logoutBtn.backgroundColor = .orange
        logoutBtn.addTarget(self, action: #selector(logoutBtnAction), for: .touchUpInside)
        return logoutBtn
    }()

    private func _setupView() {
        self.title = "系统设置"
        self.view.backgroundColor = .white

        self.tableView.backgroundColor = .white

        form +++ Section()
            <<< ImageRow("my.page.message1.cell.title") {
                $0.cell.titleLab.text = "语言选择"
                $0.cell.rightImageView.image = R.image.bar_icon_my()
                }.onCellSelection({ [unowned self] _, _  in
                    let safari = SafariViewController(url: NSURL(string: "http://www.baidu.com")! as URL)
                    self.present(safari, animated: true, completion: nil)
                })

            <<< SwitchRow("my.page.system2.cell.title") {
                $0.title = "输入密码唤起app"
                $0.value = true
                }.onChange { [unowned self] row in
                    self.didChange?(.state(isEnabled: row.value ?? false))
            }

            <<< SwitchRow("my.page.system.3cell.title") {
                $0.title = "支持指纹/面部识别"
                $0.value = true
                }.onChange { [unowned self] row in
                    self.didChange?(.state(isEnabled: row.value ?? false))
            }

            <<< SwitchRow("my.page.system.3ceddll.title") {
                $0.title = "转账开启指纹/面部识别"
                $0.value = true
                }.onChange { [unowned self] row in
                    self.didChange?(.state(isEnabled: row.value ?? false))
        }
    }

    @objc func logoutBtnAction() {
        let vc = CreateWalletAccountViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
