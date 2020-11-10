//
//  AboutCell.swift
//  Reboot
//
//  Created by Hovo on 11/10/20.
//

import UIKit

class AboutCell: UITableViewCell {

    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var textLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        aboutView.layer.cornerRadius = 10
        aboutView.layer.borderColor = UIColor.lightGray.cgColor
        aboutView.layer.borderWidth = 0.1
        aboutView.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.16)
        aboutView.layer.shadowRadius = 10
        aboutView.layer.shadowOffset = CGSize(width: 0, height: 1)
        aboutView.layer.shadowOpacity = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
