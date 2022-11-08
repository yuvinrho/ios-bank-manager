//
//  BankWork.swift
//  BankManagerConsoleApp
//
//  Created by 노유빈 on 2022/11/07.
//
import Foundation

enum BankWork: CaseIterable {
    case deposit
    case loan
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }

    var time: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var microSecondTime: useconds_t {
        return useconds_t(self.time * 1000000)
    }
}
