//  Truth or dare

//  Created by Антон Баландин on 17.08.23.
//

import UIKit

class ViewController: UIViewController {

    private var labelDeveloper: UILabel = {
        let labelDeveloper = UILabel()
        labelDeveloper.text = "😎 Balandzin Anton presents"
        labelDeveloper.textAlignment = .center
        labelDeveloper.font = labelDeveloper.font.withSize(12)
        labelDeveloper.backgroundColor = .white
        labelDeveloper.numberOfLines = 0
        return labelDeveloper
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Правда или действие?"
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        label.backgroundColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    var buttonTruth: UIButton = {
        let buttonTruth = UIButton()
        buttonTruth.setTitle("Правда", for: .normal)
        buttonTruth.setTitleColor(.black, for: .normal)
        buttonTruth.backgroundColor = .green
        buttonTruth.layer.cornerRadius = 10
        buttonTruth.layer.borderWidth = 2
        buttonTruth.setTitleColor(.black, for: .normal)
        buttonTruth.setTitleColor(.yellow, for: .highlighted)
        return buttonTruth
    }()
    
    var buttonDare: UIButton = {
        let buttonDare = UIButton()
        buttonDare.setTitle("Действие", for: .normal)
        buttonDare.setTitleColor(.black, for: .normal)
        buttonDare.backgroundColor = .red
        buttonDare.layer.cornerRadius = 10
        buttonDare.layer.borderWidth = 2
        buttonDare.setTitleColor(.black, for: .normal)
        buttonDare.setTitleColor(.yellow, for: .highlighted)
        return buttonDare
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        buttonTruth.addTarget(self, action: #selector(truthAction), for: .touchUpInside)
        buttonDare.addTarget(self, action: #selector(dareAction), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(buttonTruth)
        view.addSubview(buttonDare)
        view.addSubview(label)
        view.addSubview(labelDeveloper)
        setupConstraints()
    }
    
    private func setupConstraints() {
        buttonTruth.translatesAutoresizingMaskIntoConstraints = false
        labelDeveloper.translatesAutoresizingMaskIntoConstraints = false
        buttonDare.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
      
        
        NSLayoutConstraint.activate([
            labelDeveloper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelDeveloper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.1),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.height - view.frame.size.height/5 - 20),
            label.bottomAnchor.constraint(equalTo: buttonTruth.topAnchor, constant: -15),
            
            buttonTruth.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonTruth.heightAnchor.constraint(equalToConstant: view.frame.size.height/5),
            buttonTruth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonTruth.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 - 40),
            
            buttonDare.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonDare.heightAnchor.constraint(equalToConstant: view.frame.size.height/5),
            buttonDare.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonDare.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 - 40)
        ])
    }
}

private extension ViewController {
    @objc func truthAction() {
        label.text = Source.getInfo(type: .word)
    }
}

private extension ViewController {
    @objc func dareAction() {
        label.text = Source.getInfo(type: .action)
    }
}
