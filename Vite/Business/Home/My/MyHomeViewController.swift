//
//  MyHomeViewController.swift
//  Vite
//
//  Created by Stone on 2018/9/7.
//  Copyright © 2018年 vite labs. All rights reserved.
//

import UIKit
import Eureka
import SafariServices

class MyHomeViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.tableView.backgroundColor = .white

        form +++
            Section {
                $0.header = HeaderFooterView<MyHomeListHeaderView>(.class)
                $0.header?.height = { 130.0 }
            }
            <<< ImageRow("my.page.message.cell.title") {
                $0.cell.titleLab.text = R.string.localizable.myPageMessageCellTitle.key.localized()
                $0.cell.rightImageView.image = R.image.bar_icon_my()
            }.onCellSelection({ [unowned self] _, _  in
                    let safari = SFSafariViewController(url: NSURL(string: "http://www.baidu.com")! as URL)
                    self.present(safari, animated: true, completion: nil)
            })

            <<< ImageRow("my.page.system.cell.title") {
                $0.cell.titleLab.text =  R.string.localizable.myPageSystemCellTitle.key.localized()
                $0.cell.rightImageView.image = R.image.bar_icon_my()

                $0.routeVCClassName =  "SystemViewController"
            }
            <<< ImageRow("my.page.help.cell.title") {
                $0.cell.titleLab.text =  R.string.localizable.myPageHelpCellTitle.key.localized()
                $0.cell.rightImageView.image = R.image.bar_icon_my()
            }
            <<< ImageRow("my.page.aboutUs.cell.title") {
                $0.cell.titleLab.text =  R.string.localizable.myPageAboutUsCellTitle.key.localized()
                $0.cell.rightImageView.image = R.image.bar_icon_my()
            }
            <<< ImageRow("my.page.fetchMoney.cell.title") {
                $0.cell.titleLab.text =  R.string.localizable.myPageFetchMoneyCellTitle.key.localized()
                $0.cell.rightImageView.image = R.image.bar_icon_my()
            }
    }
}
