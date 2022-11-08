//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/04.
//

import Foundation

struct BankManager {
    private var bankWorkers: [BankWorker]
    private let depositClientQueue: Queue<Client> = Queue()
    private let loanClientQueue: Queue<Client> = Queue()
    private var totalClientCount: Int = 0
    private var totalWorkTime: Double = 0.0
    private let group = DispatchGroup()
    
    init(bankWorkers: [BankWorker]) {
        self.bankWorkers = bankWorkers
    }
    
    mutating func addClientQueue(_ client: Client) {
        totalClientCount += 1
        
        switch client.requestWork {
        case .deposit:
            return depositClientQueue.enqueue(client)
        case .loan:
            return loanClientQueue.enqueue(client)
        }
    }
    
    mutating private func addWorkTime(_ time: Double) {
        totalWorkTime += time
    }
    
    mutating private func depositWork() {
        guard let client = depositClientQueue.dequeue() else { return }
        DispatchQueue.global().async { [self] in
            print("1")
            self.bankWorkers[0].startWork(for: client)
        }
    }
    
    mutating private func loanWork() {
        guard let client = loanClientQueue.dequeue() else { return }
        DispatchQueue.global().async {
            print("2")
            //self.bankWorkers[0].startWork(for: client)
        }
        
    }
    
    mutating private func work() {
        if !depositClientQueue.isEmpty {
            depositWork()
        }
        
        if !loanClientQueue.isEmpty {
            loanWork()
        }
    }
    
    mutating func open() {
        while !depositClientQueue.isEmpty &&
                !loanClientQueue.isEmpty {
            work()
        }
    }
    
    mutating func close() {
        let message: String =
        String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초 입니다.",
               totalClientCount,
               totalWorkTime)
        
        print("\(message)")
        totalClientCount = 0
    }
}
