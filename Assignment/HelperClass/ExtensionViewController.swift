//
//  ExtensionViewController.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//

import Foundation
import UIKit

// MARK: - Alert Extension to show alert
extension UIViewController {
    func showAlert(_ titleMessage : String, _ message: String ) {
        let alert = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
