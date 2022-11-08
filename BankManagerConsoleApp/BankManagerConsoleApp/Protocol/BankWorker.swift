//
//  BankWorkable.swift
//  BankManagerConsoleApp
//
//

import Foundation

protocol BankWorker {
    var isWorking: Bool { get set }
    mutating func startWork(for client: Client)
    mutating func finishWork(for client: Client)
}

extension BankWorker {
    mutating func changeWorkingState(_ state: Bool) {
        self.isWorking = state
    }

    mutating func startWork(for client: Client) {
        changeWorkingState(true)
        print("\(client.ticketNumber)번 고객 \(client.requestWork)업무 시작")
        usleep(client.requestWork.microSecondTime)
    }
    
    mutating func finishWork(for client: Client) {
        changeWorkingState(false)
        print("\(client.ticketNumber)번 고객 \(client.requestWork)업무 종료")
    }
}

protocol DepositWorkable { }
protocol LoanWorkable { }
