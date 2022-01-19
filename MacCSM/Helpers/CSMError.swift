//
//  CSMError.swift
//  MacCSM
//
//  Created by rtoukrichte on 18/01/2022.
//

import Foundation

/*
 Usage: throw CSMError("Error message.")
 */

struct CSMError: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }
    
    init(_ error: Error) {
        self.message = error.localizedDescription
    }

    public var localizedDescription: String {
        return message
    }
    
    static func map(_ error: Error) -> CSMError {
      return (error as? CSMError) ?? CSMError(error)
    }
    
}
