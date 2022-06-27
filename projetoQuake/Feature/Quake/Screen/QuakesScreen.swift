//
//  QuakesView.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 23/06/22.
//

import SwiftUI

struct QuakesScreen: View {
    @StateObject private var vm = QuakesViewModelImpl(
         service: QuakesServiceImpl()
     )
     
     var body: some View {
         
         Group {
             
             if vm.quakes.isEmpty {
                 
                 LoadingView(text: "Fetching ...")
                 
             } else {
                 
                 List {
                     ForEach(vm.quakes, id: \.code) { item in
                         QuakeView(item: item)
                     }
                 }
             }
         }
         .task {
             await vm.getAllQuakes()
         }
     }
}

struct QuakesView_Previews: PreviewProvider {
    static var previews: some View {
        QuakesScreen()
    }
}
