//
//  ItemVCell.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

class ItemCVCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    //landing pad to receive the pizza data
    var pizza: Pizza? {
        //we want to detect changes
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }

    func updateViews() {
        guard let pizza = pizza else { return }

        let name = pizza.name
        let cheeseType = pizza.cheeseType
        let price = pizza.price

        nameLabel.text =  name
        cheeseLabel.text = cheeseType
        priceLabel.text = "$ \(price)"
        pizzaImage.image = UIImage(named: pizza.imageName)
    }
}
