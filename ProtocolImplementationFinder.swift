//
//  ProtocolImplementationFinder.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

import Foundation

class ProtocolImplementationFinder {

    static func adapterWrapperTypes() -> [AdapterWrapperProtocol.Type] {
        allClasses(implementingProtocol: AdapterWrapperProtocol.Type.self)
    }
    
    static func allClasses<T>(implementingProtocol: T.Type) -> [T] {
        
        let numberOfClasses = Int(objc_getClassList(nil, 0))
        guard numberOfClasses > 0 else {
            return []
        }

        let classesPtr = UnsafeMutablePointer<AnyClass>.allocate(capacity: numberOfClasses)
        let autoreleasingClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(classesPtr)
        let count = objc_getClassList(autoreleasingClasses, Int32(numberOfClasses))

        guard(numberOfClasses == count) else {
            return []
        }

        defer {
            classesPtr.deallocate()
        }

        // Walk the class list, keep only classes that are T
        let ret = (0 ..< numberOfClasses).compactMap {
            classesPtr[$0] as? T
        }

        return ret
    }
}
