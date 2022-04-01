//
//  MenuVC.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

protocol PlaceOrderProtocol: AnyObject {
    func addOrder()
}

//MARK: - Boss View, details the Main VC what to do
class DetailMenuVC: UIViewController{
    
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var calsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    // ⚾️🍕 Landing pad to catch the pizza details
    var pizza: Pizza?

    //Declare the pizza delegate
    weak var pizzaDelegate: PlaceOrderProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        styleDismissButton()
    }

    func styleDismissButton() {
        dismissButton.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)), for: .normal)

        // change the color
        dismissButton.tintColor = .systemPink
    }

    func updateViews() {
        guard let pizza = pizza else { return }

        nameLabel.text = pizza.name
        prepTimeLabel.text = "⏰ 10 - 15 mins"
        cheeseLabel.text = pizza.cheeseType
        priceLabel.text = "$\(pizza.price)"
        calsLabel.text = "🔥 \(pizza.cal)"
        pizzaImageView.image = UIImage(named: pizza.imageName)
        ratingLabel.text = "⭐️ \(pizza.rating)"
        descriptionLabel.text = pizza.description
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        /*
         GOAL: When the button is tapped on VC #2, we want the count label in VC #1 to increment by 1
         */
        pizzaDelegate?.addOrder()
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)


    }
    
}
