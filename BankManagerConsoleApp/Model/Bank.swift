//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

import Foundation

struct Bank {
    private var bankManager: BankManager = BankManager()
    
    mutating func updateClients() {
        var clients: [Client] = []
        
        for _ in 1...ClientNumber.max {
            let work = [BankWork.loan, BankWork.deposit].randomElement() ?? .deposit
            let client = Client(ticketNumber: self.publishTicketNumber(), requestingWork: work)
            clients.append(client)
        }
        
        clients.forEach {
            self.addClient($0)
        }
    }
    
    mutating func addClient(_ client: Client) {
        bankManager.addClientQueue(client)
    }
    
    mutating func publishTicketNumber() -> Int {
        return bankManager.publishTicketNumber()
    }
    
    mutating func openSystem() {
        self.bankManager.open()
        self.bankManager.resetWorkData()
    }
    
    mutating func resetWorkData() {
        self.bankManager.resetWorkData()
    }
}
