//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private var bank: Bank = Bank()
    private let group: DispatchGroup = DispatchGroup()
    
    private let mainStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let addClientButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(tapAddClientButton),
                         for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(tapResetButton),
                         for: .touchUpInside)
        return button
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let waitingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        return label
    }()
    
    private let workingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        return label
    }()
    
    private let waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let workingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let workingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let statusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        addViews()
        setAutoLayout()
    }
    
    private func addViews() {
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        labelStackView.addArrangedSubview(waitingTitleLabel)
        labelStackView.addArrangedSubview(workingTitleLabel)
        
        waitingScrollView.addSubview(waitingStackView)
        workingScrollView.addSubview(workingStackView)
        
        statusStackView.addArrangedSubview(waitingScrollView)
        statusStackView.addArrangedSubview(workingScrollView)
        
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(timerLabel)
        mainStackView.addArrangedSubview(labelStackView)
        mainStackView.addArrangedSubview(statusStackView)
        
        self.view.addSubview(mainStackView)
    }
    
    private func setAutoLayout() {
        mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.topAnchor).isActive = true
        waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.widthAnchor).isActive = true
        
        workingStackView.topAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.topAnchor).isActive = true
        workingStackView.leadingAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        workingStackView.trailingAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        workingStackView.bottomAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        workingStackView.widthAnchor.constraint(equalTo: workingScrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
    
    @objc private func tapAddClientButton() {
        for _ in 0..<ClientNumber.max {
            let ticketNumber = bank.publishTicketNumber()
            let requestingWork = BankWork.allCases.randomElement() ?? .deposit
            let client = Client(ticketNumber: ticketNumber, requestingWork: requestingWork)
            bank.addClient(client)
            
            let label: UILabel = UILabel()
            label.text = "\(client.ticketNumber) - \(client.requestingWork.name)"
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = ticketNumber
            
            if requestingWork == .loan {
                label.textColor = .systemPurple
            }
            
            waitingStackView.addArrangedSubview(label)
        }
        
        work()
    }
    
    @objc private  func tapResetButton() {
        waitingStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        workingStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        bank.resetWorkData()
    }
    
    private func doDepositWork(by bankWorker: BankWorker) {
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
            while !self.bank.bankManager.depositClientQueue.isEmpty {
                guard let client = self.bank.bankManager.depositClientQueue.dequeue() else { return }
                bankWorker.startWork(for: client)
                
                DispatchQueue.main.async { [weak self] in
                    guard let clientLabel = self?.view.viewWithTag(client.ticketNumber) as? UILabel else { return }
                    self?.addView(clientLabel, from: self?.workingStackView)
                    print("\(clientLabel.text ?? "") 업무시작")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + client.requestingWork.time) {
                        self?.removeView(clientLabel)
                        print("\(clientLabel.text ?? "") 업무종료")
                    }
                }
                
        
            }
        }
    }
    
    
    private func doLoanWork(by bankWorker: BankWorker) {
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
            while !self.bank.bankManager.loanClientQueue.isEmpty {
                guard let client = self.bank.bankManager.loanClientQueue.dequeue() else { return }
                bankWorker.startWork(for: client)
                
                DispatchQueue.main.async { [weak self] in
                    guard let clientLabel = self?.view.viewWithTag(client.ticketNumber) as? UILabel else { return }
                    self?.addView(clientLabel, from: self?.workingStackView)
                    print("\(clientLabel.text ?? "") 업무시작")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + client.requestingWork.time) {
                        self?.removeView(clientLabel)
                        print("\(clientLabel.text ?? "") 업무종료")
                    }
                }
                
            }
        }
    }
    
    private func addView(_ view: UIView!, from stackView: UIStackView!) {
        view.isHidden = true
        stackView.addArrangedSubview(view)
        
        UIView.animate(withDuration: 0.3) {
            view.isHidden = false
        }
    }
    
    private func removeView(_ view: UIView) {
        UIView.animate(withDuration: 0.3) {
            view.isHidden = true
        } completion: { _ in
            view.removeFromSuperview()
        }
    }
    
    private func work() {
        for worker in bank.bankManager.bankWorkers {
            switch worker.bankWork {
            case .deposit:
                doDepositWork(by: worker)
            case .loan:
                doLoanWork(by: worker)
            default:
                return
            }
        }
    }
}

