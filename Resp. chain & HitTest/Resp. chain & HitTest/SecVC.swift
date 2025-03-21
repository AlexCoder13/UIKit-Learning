//
//  MyVC.swift
//  Resp. chain & HitTest
//
//  Created by Александр Семёнов on 21.03.2025.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: Properties
    private lazy var myButton: UIButton = {
        let myButton = UIButton()
        myButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        myButton.tintColor = .white
//        myButton.backgroundColor = .blue
        myButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    private lazy var myLabel1: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "SATISFACTION"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 45, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private lazy var myLabel2: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "SATISFACTION"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 45, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private lazy var myLabel3: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "SATISFACTION"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 45, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private lazy var myLabel4: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "SATISFACTION"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 45, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private lazy var myLabel5: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "SATISFACTION"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 45, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemOrange
        
        view.addSubview(myButton)
        view.addSubview(myLabel1)
        view.addSubview(myLabel2)
        view.addSubview(myLabel3)
        view.addSubview(myLabel4)
        view.addSubview(myLabel5)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            myButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            myButton.heightAnchor.constraint(equalToConstant: 15),
            myButton.widthAnchor.constraint(equalToConstant: 15),
            
            myLabel1.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 100),
            myLabel1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myLabel1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            myLabel2.topAnchor.constraint(equalTo: myLabel1.bottomAnchor, constant: 40),
            myLabel2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myLabel2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            myLabel3.topAnchor.constraint(equalTo: myLabel2.bottomAnchor, constant: 40),
            myLabel3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myLabel3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            myLabel4.topAnchor.constraint(equalTo: myLabel3.bottomAnchor, constant: 40),
            myLabel4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myLabel4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            myLabel5.topAnchor.constraint(equalTo: myLabel4.bottomAnchor, constant: 40),
            myLabel5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myLabel5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    @objc
    private func tapButton() {
        self.dismiss(animated: true)
    }
    
}
