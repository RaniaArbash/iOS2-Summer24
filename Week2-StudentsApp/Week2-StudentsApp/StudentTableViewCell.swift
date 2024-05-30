//
//  StudentTableViewCell.swift
//  Week2-StudentsApp
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var stdImage: UIImageView!
    
    @IBOutlet weak var stdID: UILabel!
    
    @IBOutlet weak var stdName: UILabel!
    
    
    @IBOutlet weak var stdProgram: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
     super.layoutSubviews()
     self.stdImage.layer.cornerRadius = self.stdImage.frame.width / 2
     self.stdImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
