//
//  GuessViewController.swift
//  GuessTheNumber
//
//  Created by Mehmet Arıkan on 15.07.2022.
//

import UIKit

class GuessViewController: UIViewController {

    @IBOutlet weak var labelKalan: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textfieldTahmin: UITextField!
    
    
    var rastgeleSayi : Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rastgeleSayi = Int(arc4random_uniform(100))
        print("Rastgele Sayi : \(rastgeleSayi!)")
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool {
            
            let gidilecekVC = segue.destination as! ResultViewController
            
            gidilecekVC.sonuc = gelenVeri
            gidilecekVC.sayi = rastgeleSayi
            
        }
    }
    
    @IBAction func tahminEt(_ sender: Any) {
        
        labelYardim.isHidden = false
        
        kalanHak -= 1
        
        if let veri = textfieldTahmin.text {
            if let tahmin = Int(veri) {
                
                if kalanHak != 0 {
                    
                    if tahmin == rastgeleSayi! {
                        // Doğru bildi
                        // sayfa geçişi yap
                        
                        let sonuc = true
                        performSegue(withIdentifier: "GuessToResult", sender: sonuc)
                        
                    }
                    
                    if tahmin > rastgeleSayi! {
                        labelYardim.text = "Azalt"
                        labelKalan.text = "Kalan hak: \(kalanHak)"
                    }
                    
                    if tahmin < rastgeleSayi! {
                        labelYardim.text = "Arttır"
                        labelKalan.text = "Kalan hak: \(kalanHak)"
                    }
                    
                } else {
                    // hak bitti
                    // sayfa geçişi yap
                    
                    let sonuc = false
                    performSegue(withIdentifier: "GuessToResult", sender: sonuc)
                    
                    
                }
                textfieldTahmin.text = ""
            }
        } 
    }
}
