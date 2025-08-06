//
//  ContentView.swift
//  ITour
//
//  Created by Dundi vignesh Gutti on 8/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations : [Destination]
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path ){
            List{
                ForEach(destinations){
                    destination in
                    NavigationLink(value: destination{
                        
                        VStack(alignment: .leading){
                            Text(destination.name)
                                .font(.headline)
                            Text(destination.date.formatted(date:.long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteDestination n )
            }
            .navigationTitle("ITour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar{
                Button("Add Sample",action: addSample)
                Button("Add Destination", systemImage: "plus"),action: addDestination)
            }
        }
    }
    

    
    func addDestination(){
        let destination = Destination
        modelContext.insert(destination)
        path = [destination]
    }
    
    
    func deleteDestination(_ indexSet: IndexSet){
        for index in indexSet{
            let destinationToDelete = destinations[index]
            modelContext.delete(destinationToDelete)
        }
        
    }
}

#Preview {
    ContentView()
}
