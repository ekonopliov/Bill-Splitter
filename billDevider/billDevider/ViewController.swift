import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stepperDevide: UIStepper!
    @IBOutlet weak var txtBillTotalField: UITextField!
    @IBOutlet weak var txtEach: UILabel!
    @IBOutlet weak var txtDevideCount: UILabel!
    var total:Float = 0.0
    @IBOutlet weak var txtTip: UILabel!
    @IBOutlet weak var txtPercentForTip: UILabel!
    @IBOutlet weak var sliderTip: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self,action:#selector(hideKeyboard))
        
        txtBillTotalField.keyboardType = UIKeyboardType.numbersAndPunctuation
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func sliderListener(_ sender: Any) {
        refreshLabels()
    }
    @IBAction func txtBillTotal(_ sender: Any) {
        refreshLabels()
    }
    
    @IBAction func stepperListener(_ sender: Any) {
        refreshLabels()
    }
    
    func refreshLabels(){
        total = (txtBillTotalField.text!.replacingOccurrences(of: ",", with: ".") as NSString).floatValue
        
        let tipTax = total * sliderTip.value.rounded() * 0.01
        let devide = Float(stepperDevide.value)
        let each = (total + tipTax) / devide
     
        txtEach.text = (NSString(format: "%.2f€", each) as String).replacingOccurrences(of: ".", with: ",")
        
        txtDevideCount.text = NSString(format: "%.0f", devide) as String
            
        txtTip.text = (NSString(format: "%.2f€", tipTax) as String).replacingOccurrences(of: ".", with: ",")
        
        txtPercentForTip.text =  NSString(format: "%.0f", sliderTip.value) as String +  "% for tip"
    }
    
}

