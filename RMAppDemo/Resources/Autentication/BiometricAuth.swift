//
//  BiometricAuth.swift
//  RMAppDemo
//
//  Created by BioOsc on 14/06/26.
//

import Foundation
import LocalAuthentication

class FaceIDAuth {
    
    let context: LAContext = LAContext()
    
    func authUser(completion: @escaping (Bool, Error?) -> Void) {
        var error: NSError?
        
        let policy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
        if context.canEvaluatePolicy(policy, error: &error) {
            context.evaluatePolicy(policy, localizedReason: "Identify yourself to access Favorites.") { success, evaluationError in
                DispatchQueue.main.async {
                    completion(success, evaluationError)
                }
            }
        } else {
            DispatchQueue.main.async {
                completion(false, error)
            }
        }
    }
    
}
