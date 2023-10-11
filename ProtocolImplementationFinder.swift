//
//  ProtocolImplementationFinder.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

import Foundation

class ProtocolImplementationFinder {
    lazy private(set) var allClasses: [AnyClass] = {
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
        
        let classes = (0 ..< numberOfClasses).map {
            classesPtr[$0]
        }
        
        return classes
    }()
    
//    func classes(metaType: MetaType) -> [AnyClass] {
//        return allClasses.filter {
//            $0.self is AdapterWrapper.Type
//        }
//    }
}
