//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let bankWorkers: [BankWorker] = [DepositBankWorker(), DepositBankWorker(), LoanBankWorker()]
let bankManager: BankManager = BankManager(bankWorkers: bankWorkers)
var bank: Bank = Bank(bankManager: bankManager)

bank.openSystem()
