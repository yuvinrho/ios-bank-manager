//
//  BankWorker.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

struct LoanBankWorker: BankWorker, LoanWorkable {
    var isWorking: Bool = false
}

struct DepositBankWorker: BankWorker, DepositWorkable {
    var isWorking: Bool = false
}
