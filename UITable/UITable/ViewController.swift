//
//  ViewController.swift
//  UITable
//
//  Created by Александр Семёнов on 05.02.2025.
//

import UIKit

private enum Constants {
    static let numberOfRowsInSection = 7
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
    
    // реакция на выбор строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // высота строки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    // view полностью для верхней секции
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.bounds.size.width, height: 25))
        label.text = "Секция \(section)"
        label.textColor = .black
        headerView.addSubview(label)
        
        return headerView
    }
    
    // высота верхней секции
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    // просто title для секции
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "секция 1"
//        } else if section == 1 {
//            return "секция 2"
//        } else {
//            return "секция 3"
//        }
//    }
}

extension ViewController: UITableViewDataSource {
    
    // кол-во секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // кол-во строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 5
        } else {
            return Constants.numberOfRowsInSection
        }
    }
    
    // какая должна быть сама ячейка (в данном случае она кастомная)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let text = "Section cell #\(indexPath.row)"
        let model = CustomTableViewCellModel(text: text) {
            if indexPath.row == 3 {
                print("Section cell: #\(indexPath.row)")
            } else {
                print("aaaaaaaaaaaaaaaaaaa")
            }
        }
        cell.configure(with: model)
        return cell
    }
}
