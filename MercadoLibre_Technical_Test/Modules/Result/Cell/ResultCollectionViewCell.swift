//
//  ResultCollectionViewCell.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 8/07/21.
//

import UIKit
import Kingfisher

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setImage(url:String){
        imageViewProduct.kf.setImage(with: URL(string: url))
    }
}
