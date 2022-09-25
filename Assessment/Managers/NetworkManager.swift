//
//  NetworkManager.swift
//  Assessment
//
//  Created by shelton chiuswa on 26/9/2022.
//

import Foundation
import Network


class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false
    
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.connected = true
            } else {
                self.connected = false
            }
        }
        monitor.start(queue: queue)
        
        print(self.connected)
    }
}
