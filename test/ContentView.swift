//
//  ContentView.swift
//  test
//
//  Created by Nikola Jeremic on 26.2.23..
//

import SwiftUI


class SortedListsIterator {
    let lists: [[Int]]
    var indices: [Int]
    
    
    init(lists: [[Int]]) {
        self.lists = lists
        self.indices = Array(repeating: 0, count: lists.count)
    }
    //MARK: - Func Get Next
    
    func getNext() -> Int? {
        var smallest: Int?
        var smallestIndex: Int?
        for (i, index) in indices.enumerated() {
            if index < lists[i].count {
                let value = lists[i][index]
                if smallest == nil || value < smallest! {
                    smallest = value
                    smallestIndex = i
                }
            }
        }
        if smallest != nil {
            indices[smallestIndex!] += 1
        }
        return smallest
    }
}


//MARK: - Sorted List View

struct SortedListsView: View {
    let lists: [[Int]]
    let iterator: SortedListsIterator
    
    @State private var current: Int?
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("List 1: \(lists[0].description)")
                    .padding()
                Text("List 2: \(lists[1].description)")
                    .padding()
                Text("List 3: \(lists[2].description)")
                
                    .padding()
                Divider()
                
                Text("Next number: \(current ?? -1)")
                    .font(.title)
                    .padding()
                Button(action: {
                    current = iterator.getNext()
                }) {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 50)
                        .cornerRadius(10)
                        .overlay(
                            Text("Get Next Number")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            
                        )
                    
                }
                
                
                
                
                
            }
            .padding()
            .navigationBarTitle("Siber Systems Test")
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
        }
        
        
    }
    
    init(lists: [[Int]]) {
        self.lists = lists
        self.iterator = SortedListsIterator(lists: lists)
    }
}
//MARK: - Content View

struct ContentView: View {
    let lists = [[1,8,15,16,35], [2,7,12,40], [10,13,14]]
    
    
    var body: some View {
        SortedListsView(lists: lists)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}
