//
//  ViewController.swift
//  RGBtoHEXConventer
//
//  Created by Saide Cekic on 6.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreem: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelected: UILabel!
    var selectedIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        selectedIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreem.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelected.backgroundColor = UIColor.white
        
        
        if selectedIndex == 0 {
            btnConvert.setTitle("RGB-HEX Conventer", for: UIControl.State.normal)
        }else{
            btnConvert.setTitle("HEX-RGB Conventer", for: UIControl.State.normal)
        }
        
    }
    
    
    
    @IBAction func btnConvertTapped(_ sender: UIButton) {
        // RGB- HEX Conventer
        if selectedIndex == 0{
            ConvertRGBtoHEX()
            
        }else{
            // HEX -RGB
            ConvertHEXtoRGB()
        }
    }
    
    func ConvertRGBtoHEX(){
        
        guard let redValue = UInt8(txtRed.text!) else {return}
        
        guard let greenValue = UInt8(txtGreem.text!) else {return}
        
        guard let blueValue = UInt8(txtBlue.text!) else {return}
        
                    let redHex = String(format: "%2X" , redValue)
                    let greenHex = String(format: "%2X" , greenValue)
                    let blueHex = String (format: "%2X", blueValue)
                    
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelected.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
        
    
    
    
    func ConvertHEXtoRGB(){
        guard let redValue = UInt8(txtRed.text! ,radix:16)else{return}
        guard let greenValue = UInt8(txtGreem.text!, radix:16)else{return}
        guard let blueValue = UInt8(txtBlue.text! , radix:16)else{return}
        
lblResult.text = "RED : #\(redValue)\n GREEN :\(greenValue)\n BLUE:\(blueValue)"
lblSelected.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
         
    }



}
