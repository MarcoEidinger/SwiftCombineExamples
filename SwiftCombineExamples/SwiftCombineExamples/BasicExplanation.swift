//
//  SimpleExample.swift
//  SwiftCombineExamples
//
//  Created by Eidinger, Marco on 3/8/21.
//

import Foundation
import SwiftUI

class SimpleExampleModel: ObservableObject {

    static var randomName: String {
        "Mike \(["Palmers", "Chamers", "Balmers"].randomElement()!)"
    }

    @Published var date: String

    var name: String = "Hello"

    init() {
        self.date = Date().description
    }

    func startTimers() {
        // update name every 2 seconds
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.updateName), userInfo: nil, repeats: true)
        // call objectWillChange.send() every 5 seconds
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.updateObject), userInfo: nil, repeats: true)
        // update @Published date every 10 seconds
        _ = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.updateDate), userInfo: nil, repeats: true)
    }

    @objc func updateDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .long
        dateFormatter.locale = Locale.current
        self.date = dateFormatter.string(from: Date())
        print("date updated")
    }

    @objc func updateName() {
        name = SimpleExampleModel.randomName
        print("name updated")
    }

    @objc func updateObject() {
        self.objectWillChange.send()
        print("object updated")
    }
}

struct SimpleExampleContentView: View {
    @ObservedObject var model = SimpleExampleModel()
    var body: some View {

        VStack {
        ExpHeaderView("ObservableObject", subtitle: "State Handling", desc: "View gets re-calcuated when objectWillChange.send was called explicitly OR when @Published properties were updated.",
                      back: .green, textColor: .white)

        Text("Name: \(model.name)")
            .padding()
        Text("Date: \(model.date)")
            .padding()
        }.onAppear(perform: {
            model.startTimers()
        })
    }
}

struct SimpleExampleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
