//
//  DestinationListingView.swift
//  ITour
//
//  Created by Dundi vignesh Gutti on 8/11/25.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations : [Destination]
    
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        List{
            ForEach(destinations){
                destination in
                NavigationLink(value: destination){
                    
                    VStack(alignment: .leading){
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date:.long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestination)
        }
    }
    
    init(sort: SortDescriptor<Destination>, searchString : String){
        _destinations = Query(filter :#Predicate{
            if searchString.isEmpty{
                return true
            }
            else{
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    
    func deleteDestination(_ indexSet: IndexSet){
        for index in indexSet{
            let destinationToDelete = destinations[index]
            modelContext.delete(destinationToDelete)
        }
        
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
