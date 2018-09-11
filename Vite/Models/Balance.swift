//
//  Balance.swift
//  Vite
//
//  Created by Stone on 2018/9/6.
//  Copyright © 2018年 vite labs. All rights reserved.
//

import Foundation
import BigInt

struct Balance: BalanceType, CustomStringConvertible {

    var value: BigInt

    init(value: BigInt = BigInt(0)) {
        self.value = value
    }

    var amountShort: String {
        return (value/1000000000000000000).description
    }

    var amountFull: String {
        return (value/1000000000000000000).description
    }

    var description: String {
        return (value/1000000000000000000).description
    }
}
