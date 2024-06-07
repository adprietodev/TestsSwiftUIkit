//
//  DropDownViewController.swift
//  TestsSwiftUIkit
//
//  Created by Adrian Prieto Villena on 7/6/24.
//

import UIKit

class DropDownViewController: UIViewController {

    private let dropdownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dropdown", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private let dropdownTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 5
        tableView.clipsToBounds = true
        return tableView
    }()
    
    private var options: [String] = ["Option 1", "Option 2", "Option 3", "Option 4"]
    private var isDropdownOpen = false

    private var dropdownTableHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(dropdownButton)
        view.addSubview(dropdownTableView)
        
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        dropdownTableView.separatorStyle = .none
        
        dropdownTableHeightConstraint = dropdownTableView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            dropdownButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dropdownButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropdownButton.widthAnchor.constraint(equalToConstant: 200),
            dropdownButton.heightAnchor.constraint(equalToConstant: 40),
            
            dropdownTableView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 5),
            dropdownTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropdownTableView.widthAnchor.constraint(equalTo: dropdownButton.widthAnchor),
            dropdownTableHeightConstraint
        ])
        
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        dropdownTableView.isHidden = true
        
        // Registra la celda personalizada
        dropdownTableView.register(DropDownTableViewCell.self, forCellReuseIdentifier: DropDownTableViewCell.identifier)
        
        dropdownButton.addTarget(self, action: #selector(didTapDropdownButton), for: .touchUpInside)
    }
    
    @objc private func didTapDropdownButton() {
        isDropdownOpen.toggle()
        dropdownTableView.isHidden = !isDropdownOpen
        
        dropdownTableHeightConstraint.constant = isDropdownOpen ? 200 : 0
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension DropDownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DropDownTableViewCell.identifier, for: indexPath) as? DropDownTableViewCell else {
            return UITableViewCell()
        }
        cell.customLabel.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropdownButton.setTitle(options[indexPath.row], for: .normal)
        didTapDropdownButton()
    }
}
