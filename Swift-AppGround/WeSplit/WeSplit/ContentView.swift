//
//  ContentView.swift
//  WeSplit
//
//  Created by Dundi vignesh Gutti on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    let tip = [0,10,15,20,25]
    @State private var name = ""
    @State private var amount = 0.0
    @State private var NoOfPeopel = 2
    @State private var tipPercentage = 20
    @FocusState private var amountISFocused: Bool
    
    
    var totalPerPerson:Double{
        let peopleCount = Double(NoOfPeopel+2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandTotal = tipValue + amount
        let amountPerPerson = (grandTotal + tipValue) / peopleCount
        
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountISFocused)
                    Picker("Selct Count", selection: $NoOfPeopel){
                        ForEach(2..<99){
                            Text("\($0) People")
                        }
                    }
            }
                
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tip, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("How much would you like to tip?")
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: "USD"))
                }header: {
                    Text("Total per person")
                }
            
            
                .navigationTitle("WeSplit")
                
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Done"){
                            amountISFocused = false
                        }
                    }
                }
                
                
            }
            
            
        }
    }
}
    

#Preview {
    ContentView()
}
