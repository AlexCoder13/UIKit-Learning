//
//  MyVC.swift
//  Resp. chain & HitTest
//
//  Created by Александр Семёнов on 21.03.2025.
//

import UIKit

final class MyViewController: UIViewController {
    
    // MARK: Properties
    private lazy var myButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.setTitle("Push me", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        myButton.layer.cornerRadius = 25
        myButton.backgroundColor = .systemOrange
        myButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    private lazy var myLabel1: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "And then just touch me"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 23, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private lazy var myLabel2: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Till I can get my"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 23, weight: .bold)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private lazy var myLabel3: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "..."
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 23, weight: .bold)
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
        view.backgroundColor = .systemBlue
        
        view.addSubview(myButton)
        view.addSubview(myLabel1)
        view.addSubview(myLabel2)
        view.addSubview(myLabel3)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 70),
            myButton.widthAnchor.constraint(equalToConstant: 270),
            
            myLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel1.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 30),
            myLabel1.heightAnchor.constraint(equalToConstant: 40),
            myLabel1.widthAnchor.constraint(equalToConstant: 250),
            
            myLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel2.topAnchor.constraint(equalTo: myLabel1.bottomAnchor, constant: 20),
            myLabel2.heightAnchor.constraint(equalToConstant: 40),
            myLabel2.widthAnchor.constraint(equalToConstant: 250),
            
            myLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel3.topAnchor.constraint(equalTo: myLabel2.bottomAnchor, constant: 15),
            myLabel3.heightAnchor.constraint(equalToConstant: 40),
            myLabel3.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc
    private func tapButton() {
        let controller = SecondViewController()
        self.present(controller, animated: true)
    }
    
}
