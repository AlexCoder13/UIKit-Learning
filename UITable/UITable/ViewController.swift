//
//  ViewController.swift
//  UITable
//
//  Created by Александр Семёнов on 05.02.2025.
//

import UIKit

private enum Constants {
    static let numberOfRowsInSection = 20
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private lazy var newTable: UITableView = {
        let newTable = UITableView()
        newTable.delegate = self
        newTable.dataSource = self
        newTable.register(CustomTableViewCell.self, forCellReuseIdentifier: "customTableViewCell")
        newTable.translatesAutoresizingMaskIntoConstraints = false
        return newTable
    }()
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(newTable)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            newTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 3 ? 80 : 44
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let text = "Section cell #\(indexPath.row)"
        let model = CustomTableViewCellModel(text: text) {
            if indexPath.row == 3 {
                print("Section cell #\(indexPath.row)")
            } else {
                print("aaaaaaaaaaaaaaaaaaa")
            }
        }
        cell.configure(with: model)
        return cell
    }
}
