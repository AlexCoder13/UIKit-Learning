//
//  VC.swift
//  Resp. chain & HitTest
//
//  Created by Александр Семёнов on 21.03.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: Properties
    private lazy var rootView: UIView = {
        let rootView = HitTestLoggingView(name: "Root View")
        rootView.backgroundColor = .gray
        
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    private lazy var redView: UIView = {
       let redView = HitTestLoggingView(name: "Red View")
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    private lazy var greenView: UIView = {
       let redView = HitTestLoggingView(name: "Green View")
        redView.backgroundColor = .green
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    private lazy var blueView: UIView = {
       let redView = HitTestLoggingView(name: "Blue View")
        redView.backgroundColor = .blue
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    private lazy var orangeView: UIView = {
       let redView = HitTestLoggingView(name: "Orange View")
        redView.backgroundColor = .orange
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
        // 1 задача.
//        blueView.isUserInteractionEnabled = false
    }
    
    private func setupUI() {
        view.addSubview(rootView)
        rootView.addSubview(redView)
        redView.addSubview(greenView)
        rootView.addSubview(blueView)
        blueView.addSubview(orangeView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            
            redView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 70),
            redView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 20),
            redView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -20),
            redView.heightAnchor.constraint(equalToConstant: 300),
            
            greenView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 40),
            greenView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 20),
            greenView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -20),
            greenView.heightAnchor.constraint(equalToConstant: 100),
            
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 70),
            blueView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 20),
            blueView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -20),
            blueView.heightAnchor.constraint(equalToConstant: 300),
            
            orangeView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 40),
            orangeView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 20),
            orangeView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: -20),
//            orangeView.heightAnchor.constraint(equalToConstant: 100),
            
            // 2 задача.
            orangeView.heightAnchor.constraint(equalToConstant: 350)
            ])
    }
}

class HitTestLoggingView: UIView {
    let name: String
    
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("\(name): hitTest вызван для точки \(point)")
        let result = super.hitTest(point, with: event)
        print("\(name): hitTest вернул \(String(describing: result?.backgroundColor ?? nil))"
        )
        return result
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let result = super.point(inside: point, with: event)
        print("\(name): point(inside:) вернул \(result)")
        return result
    }
    
    override var description: String {
        return name
    }
}
