//
//  PizzaVC.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

//Conform to the protocol
class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PlaceOrderProtocol {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!

    private let pizzaData = PizzaData()
    var tally: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    func addOrder() {
        tally += 1

        DispatchQueue.main.async {
            self.totalLabel.text = "\(self.tally)"
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pizzaData.pizzas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // define the cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pizzaCell", for: indexPath) as? ItemCVCell else { return UICollectionViewCell() }

        // index of pizzas
        let pizzaOptions = pizzaData.pizzas[indexPath.row]

        // link to landing pad
        cell.pizza = pizzaOptions

        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //where we want to go to
        guard let destinationVC = segue.destination as? DetailMenuVC,

                // our custom cell
              let cell = sender as? ItemCVCell,

                //indexPath
              let indexPath = self.myCollectionView.indexPath(for: cell) else { return }

        let pizzaOptions = pizzaData.pizzas[indexPath.row]

        //Lets tie this all together
        destinationVC.pizza = pizzaOptions

        //Need to assign the delegate to our VC #1
        // VC #1 becomes the intern with 'self' and takes the order from the boss VC #2
        destinationVC.pizzaDelegate = self
    }

    // MARK: - Animation
    func animateAstroDude(myImageView: UIImageView) {
        let originalCenter = myImageView.center
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, animations: {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                myImageView.center.x -= 80.0
                myImageView.center.y += 10.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
                myImageView.transform = CGAffineTransform(rotationAngle: -.pi / 80)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                myImageView.center.x -= 100.0
                myImageView.center.y += 50.0
                myImageView.alpha = 0.0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                myImageView.transform = .identity
                myImageView.center = CGPoint(x:  900.0, y: 100.0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
                myImageView.center = originalCenter
                myImageView.alpha = 1.0
            }

        }, completion: { (_) in
            //
        })
    }


    // MARK: - Action
    @IBAction func orderButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.totalLabel.text = "0"
            self.animateAstroDude(myImageView: self.logoImageView)
        }
    }

}
