//
//  ResultViewController.swift
//  GuessTheNumber
//
//  Created by Mehmet Arıkan on 15.07.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var imageViewResult: UIImageView!
    
    var sonuc: Bool?
    var sayi: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        print(sonuc!)
        
        if sonuc! {
            
            let image = UIImage(named: "succes")
            imageViewResult.image = image
            
            ResultLabel.text = "Helal lan yusufiiii... Sayı: \(sayi!)"
            ResultLabel.textColor = UIColor.green
            
            
        } else {
            let image = UIImage(named: "failed")
            imageViewResult.image = image
            
            ResultLabel.text = "Yanlış Tahmin ettin salak... Sayı: \(sayi!)"
            ResultLabel.textColor = UIColor.red
        }
    }
    
    
 
    
    @IBAction func basla(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
}
