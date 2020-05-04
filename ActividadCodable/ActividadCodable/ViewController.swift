//
//  ViewController.swift
//  ActividadCodable
//
//  Created by user168655 on 4/30/20.
//  Copyright © 2020 Moisés Fernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var listaNumeros: [Numero] = []
    var numeroActual : Numero!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numeroActual?.valor = 0
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        let app = UIApplication.shared
               
        NotificationCenter.default.addObserver(self, selector: #selector(guardarNumeros), name: UIApplication.didEnterBackgroundNotification, object: app)

        listaNumeros = [Numero(valor: 0)]
        
        if FileManager.default.fileExists(atPath: dataFileURL().path){
            obtenerNumeros()
        }
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        listaNumeros.count
    }
    
    @IBAction func agregar(_ sender: UIButton) {
        numeroActual?.valor += 1
        
        listaNumeros.append(numeroActual)
        
        pickerView.reloadAllComponents()
    }
    
    func dataFileURL () -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Numeros.plist")
        return pathArchivo
    }
    
    @IBAction func guardarNumeros() {
        do {
            let data = try PropertyListEncoder().encode(listaNumeros)

            try data.write(to: dataFileURL())
            
            let num: Numero! = nil
            
            num.valor = pickerView.selectedRow(inComponent: 0)
            
            listaNumeros.append(num)
    
        }
        catch {
            print("Error al guardar los datos")
        }
    }
    
    func obtenerNumeros() {
        listaNumeros.removeAll()
        
        do {
            let data = try Data.init(contentsOf: dataFileURL())
            listaNumeros = try PropertyListDecoder().decode([Numero].self, from: data)
            let num : Numero = listaNumeros.last!
            listaNumeros.removeLast()
            pickerView.selectRow(num.valor, inComponent: 0, animated: true)
        }
        catch {
            print("Error al cargar los datos del archivo")
        }
        
        pickerView.reloadAllComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        
        if let view = view {
            label = view as! UILabel
        }
        
        label.font = UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.bold)
        label.textColor = UIColor.blue
        label.textAlignment = .center

        return label
    }
}

