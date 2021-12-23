//
//  HistoryScreenViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit
import SnapKit

class HistoryScreenViewController: UIViewController {
    
    var historyScreenViewModel: HistoryScreenViewModel
    
    private let historyLabel = UILabel()
    private let clearHistoryButton = UIButton(type: .system)
    private let tableView = UITableView()
    
    init(viewModel: HistoryScreenViewModel) {
        self.historyScreenViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyScreenViewModel.updateInterface { (isDone) in
            guard isDone else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        configureTableView()
    }
    
    @objc private func clearHistoryButtonPressed() {
        tableView.reloadData()
    }
}

extension HistoryScreenViewController {
    
    // The main function to setup interface
    private func setupInterface() {
        view.backgroundColor = UIColor(asset: Asset.backgroundColor)
        
        setupNavigationBar()
        setupHistoryLabel()
        setupClearHistoryButton()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
    }
    
    private func setupHistoryLabel() {
        historyLabel.text = "History"
        historyLabel.textAlignment = .center
        historyLabel.textColor = UIColor(asset: Asset.secondaryColor)
        historyLabel.font = UIFont.systemFont(ofSize: 36)
        view.addSubview(historyLabel)
        historyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30)
            make.height.equalTo(43)
            make.width.equalTo(265)
        }
    }
    
    private func setupClearHistoryButton() {
        clearHistoryButton.setTitle("Clear history", for: .normal)
        clearHistoryButton.setTitleColor(UIColor(asset: Asset.buttonColor), for: .normal)
        clearHistoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(clearHistoryButton)
        clearHistoryButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(historyLabel.snp.bottom).offset(15)
            make.height.equalTo(34)
            make.width.equalTo(159)
        }
        clearHistoryButton.addTarget(self, action: #selector(clearHistoryButtonPressed), for: .touchUpInside)
    }
    
    // The function to setup the position of the TableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(clearHistoryButton.snp.bottom).offset(15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(32)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(16)
        }
    }
}

extension HistoryScreenViewController {
    
    // The function to setup the TableView and a TableViewCell
    private func configureTableView() {
        tableView.register(HistoryScreenTableViewCell.self,
                           forCellReuseIdentifier: HistoryScreenTableViewCell.identifier)
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
}

extension HistoryScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyScreenViewModel.answersHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HistoryScreenTableViewCell.identifier,
                for: indexPath) as? HistoryScreenTableViewCell else { return UITableViewCell() }
        let answer = historyScreenViewModel.answersHistory[indexPath.row]
        let answerText = answer.text
        let date = answer.date
        cell.configureLabel(text: answerText, date: Formatters.Date.formatter.string(from: date))
        return cell
    }
}
