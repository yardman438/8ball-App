// swiftlint:disable comment_spacing

import UIKit

// TASK 1: Deadlock

func deadlockSimulation() {
    let mySerialQueue = DispatchQueue(label: "com.gcd.mySerial")
    mySerialQueue.async {
        print("This text will be printed")
        // And here is the deadlock
        DispatchQueue.main.sync {
            print("This text will not be printed")
        }
    }
    mySerialQueue.sync {
        print("And this text will not be printed too")
    }
}

//deadlockSimulation()

// TASK 2: Cancellation of DispatchWorkItem

func cancellationOfDispatchWorkItem() {
    let queue = DispatchQueue.global(qos: .background)
    var item = DispatchWorkItem {
        while true {
            if item.isCancelled { break }
            print("0")
        }
    }
    queue.async(execute: item)
    queue.asyncAfter(deadline: .now() + 2) {
        item.cancel()
    }
}

//cancellationOfDispatchWorkItem()
