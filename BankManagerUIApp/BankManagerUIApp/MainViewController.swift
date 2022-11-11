//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let mainStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
    
    let buttonStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let addClientButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let waitingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        return label
    }()
    
    let workingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        return label
    }()

    let waitingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let workingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let workingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let statusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setup()
        
    }
    
    func setup() {
        view.backgroundColor = .white
        addViews()
        setAutoLayout()
    }
    
    func addViews() {
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

    func setAutoLayout() {
        mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

