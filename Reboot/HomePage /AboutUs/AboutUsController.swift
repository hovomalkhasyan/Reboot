//
//  AboutUsController.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class AboutUsController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var barView: UIView!
    private let textArray = ["О нас", "Тренировки", "Тренеры", "Блог", "Business", "Правила"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setbarView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        
    }
    
    private func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
        
    }
    
    private func setbarView() {
        barView.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.16)
        barView.layer.shadowOffset = CGSize(width: 0, height: 6)
        barView.layer.shadowOpacity = 1
        infoView.layer.cornerRadius = 11
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.top = 20
        
    }

}

extension AboutUsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath) as! AboutCell
        cell.textLb.text = textArray[indexPath.row]
        
        return cell
    }
    
    
    
}
