//
//  ViewController.swift
//  Peticiones a Servidor
//
//  Created by Mateo Villagomez on 22/11/15.
//  Copyright © 2015 Mateo Villagomez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textField: UITextField!
   
    @IBAction func usuarioTexto(sender: AnyObject) {
       
        let attemptedUrl = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + textField.text! + "")
        
        // Downloading the web content from the url
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                if let urlContent = data {
                    
                    let webContent =  NSString(data: urlContent, encoding: NSUTF8StringEncoding)! as String
                    
                    if webContent.containsString("{}"){
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            // Error if the city does not exist or the procces failed
                            self.errorLabel.text = "No se encontro el libro! Intentalo de nuevo."
                            self.errorLabel.textColor = UIColor.orangeColor()
                            
                        })
                        
                    } else {
                        
                        //  (UserInterface) Dispatch to fast reaction
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.textView.text = webContent as String
                            print(webContent)
                            
                        })
                    }
                }
            }
            
            task.resume()
            // Error if the user enters invalid symbols
        } else {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.errorLabel.text = "Por favor ingresa un ISBN valido."
                 self.errorLabel.textColor = UIColor.orangeColor()
            })
        }
    }
        /*
        let attemptedUrl = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + textField.text! + "")
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)!
                    
                    print(webContent)
                    
                    //  (UserInterface) Dispatch to fast reaction
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.textView.text = webContent as String
                    })
                    
                    if wasSuccesful == false {
                        
                        
                        // Error if the city does not exist or the procces failed
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.errorLabel.text = "No se pudo encontrar el libro! Porfavor intentalo de nuevo."
                        })
                    }
                    
                } else {
                }
            }
            task.resume()
        }

    }
    
    
    // Action when fisnish editing not when "Search" button is triggered
    
    @IBAction func usuarioISBN(sender: UITextField) {
        
        let attemptedUrl = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + textField.text! + "")
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)!
                    
                    print(webContent)
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                    self.textView.text = webContent as String
                    })
                    
                } else {
                }
            }
            task.resume()
        }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
