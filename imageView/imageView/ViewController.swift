//
//  ViewController.swift
//  imageView
//
//  Created by admin64 on 09/10/24.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var safariButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var mailButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let imageToBeShared = image.image else { return }
        let msg = "hi all"
        let activityController = UIActivityViewController(activityItems: [imageToBeShared, msg], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: false)
        
        
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://www.google.com") else { return }
        let safariController = SFSafariViewController(url: url)
        present(safariController, animated: true)
        
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        let alertController = UIAlertController(title: "choose an image", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                imagePickerController.sourceType = .camera
                print("user selected camera")
            }
            alertController.addAction(cameraAction)
            alertController.addAction(cancelAction)
            
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
                imagePickerController.sourceType = .photoLibrary
                print("user selected photo library")
                self.present(imagePickerController, animated: true, completion: nil)
                
            }
            alertController.addAction(photoLibraryAction)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func mailButtonTapped(_ sender: UIButton) {
        let mailComposer = MFMailComposeViewController()
        mailComposer.delegate = self
        guard MFMailComposeViewController.canSendMail() else {
            print("cannot compose email")
            return }
        mailComposer.setToRecipients(["your_email@gmail.com"])
        mailComposer.setSubject("Hello")
        mailComposer.setMessageBody("Hello, World!", isHTML: false)
        
        if let image = image.image, let jpegData = image.jpegData(compressionQuality: 0.6) {
            mailComposer.addAttachmentData(jpegData, mimeType: "image/jpeg", fileName: "image.jpg")
            
        }
        present(mailComposer, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        image.image = selectedImage
        self.dismiss(animated: true)
    }
}
