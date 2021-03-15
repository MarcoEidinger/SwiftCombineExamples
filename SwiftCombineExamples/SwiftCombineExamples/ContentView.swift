//
//  ContentView.swift
//  SwiftCombineExamples
//
//  Created by Eidinger, Marco on 3/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        List {
            NavigationLink(
                destination: SimpleExampleContentView()) {
                Text("Simple Example")
            }

            NavigationLink(
                destination: ReactiveForm(model: ReactiveFormModel())) {
                Text("React Form")
            }
        }.navigationBarTitle("Examples")
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
