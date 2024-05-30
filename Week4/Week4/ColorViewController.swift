//
//  ColorViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class ColorViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    
    
    @IBOutlet weak var selectedImage: UIImageView!

    
    var colorFromFirstViewController : ColorModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor  = UIColor(cgColor: red.cgColor)
        view.backgroundColor = colorFromFirstViewController?.color
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image = info[.originalImage] as? UIImage {
            selectedImage.image = image
            dismiss(animated: true)
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("The user did not select any image")
        dismiss(animated: true)
    }

    
    @IBAction func takeAPhoto(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        c.delegate = self
        c.allowsEditing = false
        
        present(c, animated: true, completion: nil)
    }
    
    
    @IBAction func pickAnImage(_ sender: Any) {
        
        let c = UIImagePickerController()
        c.sourceType = .photoLibrary
        c.delegate = self
        c.allowsEditing = false
        
        present(c, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
