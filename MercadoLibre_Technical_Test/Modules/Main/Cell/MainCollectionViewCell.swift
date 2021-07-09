//
//  MainCollectionViewCell.swift
//  MercadoLibre_Technical_Test
//
//  Created by Christian Camilo Bernal Rojas on 7/07/21.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelText: UILabel!
    var category : MainModel.Category?

    var callbackClick: ((MainModel.Category) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setup(data:MainModel.Category){
        self.category = data
        labelText.text = data.name
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)

    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil)
    {
        callbackClick!(self.category!)
    }

}
