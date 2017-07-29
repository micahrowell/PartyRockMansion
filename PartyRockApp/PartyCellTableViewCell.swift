//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Micah Rowell on 7/29/17.
//  Copyright © 2017 Micah Rowell. All rights reserved.
//

import UIKit

class PartyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(partyRock:PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                
            } catch {
                // handle error
            }
        }
        
    }

}
