//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Wasay Khan on 4/17/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
}

class ConverterViewController: UIViewController {
    
    let converters: [Converter] = [
        Converter(label: "fahrenheit to celsius", inputUnit: " °F", outputUnit: " °C"),
        Converter(label: "celsius to fahrenheit", inputUnit: " °C", outputUnit: " °F"),
        Converter(label: "miles to kilometers", inputUnit: " mi", outputUnit: " km"),
        Converter(label: "kilometers to miles", inputUnit: " km", outputUnit: " mi")]
    
    var inputNum: Double = 0
    var outputNum: Double = 0
    var inputString: String = ""
    var outputString: String = ""
    var inputUnit: String = ""
    var outputUnit: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputDisplay.text = converters[0].inputUnit
        outputDisplay.text = converters[0].outputUnit
        
        inputUnit = converters[0].inputUnit
        outputUnit = converters[0].outputUnit
    }
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func listConversions(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Choose Converter", message: "Choose", preferredStyle: UIAlertController.Style.actionSheet)
        
        for converter in converters {
            let choice = UIAlertAction(title: converter.label, style: .default) { (UIAlertAction) -> Void in
                self.inputNum = Double(self.inputString) ?? 0
                self.inputUnit = converter.inputUnit
                self.outputUnit = converter.outputUnit
                self.inputDisplay.text = self.makeInput(inputNum: self.inputNum, inputUnit: self.inputUnit)
                self.outputDisplay.text = self.makeOutput(inputNum: self.inputNum, outputUnit: self.outputUnit)
            }
            actionSheet.addAction(choice)
        }
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func makeInput(inputNum: Double, inputUnit: String) -> String {
        var tempInputString = String(inputNum)
        tempInputString.append(inputUnit)
        return tempInputString
    }
    
    func makeOutput(inputNum: Double, outputUnit: String) -> String {
        if inputUnit == " °C" {
            outputNum = inputNum * 9/5 + 32
        } else if inputUnit == " °F" {
            outputNum = (inputNum - 32) * 5/9
        } else if inputUnit == " km" {
            outputNum = inputNum / 1.609
        } else {
            outputNum = inputNum * 1.609
        }
        
        outputNum = round(outputNum * 100) / 100
        
        var tempOutputString = String(outputNum)
        tempOutputString.append(outputUnit)
        return tempOutputString
    }
    
    @IBAction func clear(_ sender: Any) {
        inputNum = 0
        inputString = ""
        outputString = ""
        self.inputDisplay.text = inputUnit
        self.outputDisplay.text = outputUnit
    }
    
    @IBAction func changeSign(_ sender: Any) {
        inputNum *= -1
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func add9(_ sender: Any) {
        inputString.append("9")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func add8(_ sender: Any) {
        inputString.append("8")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add7(_ sender: Any) {
        inputString.append("7")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add6(_ sender: Any) {
        inputString.append("6")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add5(_ sender: Any) {
        inputString.append("5")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add4(_ sender: Any) {
        inputString.append("4")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add3(_ sender: Any) {
        inputString.append("3")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add2(_ sender: Any) {
        inputString.append("2")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add1(_ sender: Any) {
        inputString.append("1")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func add0(_ sender: Any) {
        inputString.append("0")
        inputNum = Double(inputString) ?? 0
        self.inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }

    @IBAction func addDecimal(_ sender: Any) {
        if inputString.contains(".") {
            return
        } else {
            inputString.append(".")
            inputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
            outputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
        }
    }
}
