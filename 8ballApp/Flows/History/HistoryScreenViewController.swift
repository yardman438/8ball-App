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
    
    private var historyScreenViewModel: HistoryScreenViewModel

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
        historyScreenViewModel.updateInterface()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        configureTableView()
    }
}

extension HistoryScreenViewController {
    
    // The main function to setup interface
    private func setupInterface() {
        view.backgroundColor = UIColor(asset: Asset.backgroundColor)
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        self.title = L10n.historyTitle
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.prefersLargeTitles = true
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
    }

    // The function to setup the position of the TableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
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
    }
}

extension HistoryScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyScreenViewModel.numberOfAnswer()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HistoryScreenTableViewCell.identifier,
                for: indexPath) as? HistoryScreenTableViewCell else { return UITableViewCell() }
        let answer = historyScreenViewModel.answersHistory[indexPath.row]
        guard let answerText = answer?.text, let date = answer?.date else { return cell }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.configureLabel(text: answerText + " " + dateFormatter.string(from: date))
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        guard let selectedAnswer = historyScreenViewModel.answersHistory[indexPath.row],
              editingStyle == .delete else { return }
        historyScreenViewModel.deleteAnswer(selectedAnswer)
        while historyScreenViewModel.answersHistory.contains(selectedAnswer) {
            if let answerToRemoveIndex = historyScreenViewModel.answersHistory.firstIndex(of: selectedAnswer) {
                historyScreenViewModel.answersHistory.remove(at: answerToRemoveIndex)
            }
        }
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
