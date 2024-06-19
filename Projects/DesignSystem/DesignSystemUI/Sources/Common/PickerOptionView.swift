//
//  PickerOptionView.swift
//  DesignSystemUI
//
//  Created by 김영균 on 6/19/24.
//  Copyright © 2024 mashup.dorabangs. All rights reserved.
//

import DesignSystemKit
import SwiftUI

struct PickerOptionView: View {
    private let description: String
    private let cases: [Any]
    private let typeName: String
    @Binding private var selectedIndex: Int
    
    init(description: String, cases: [Any], selectedIndex: Binding<Int>) {
        self.description = description
        self.cases = cases
        self.typeName = cases.isEmpty ? "" : "\(Mirror(reflecting: cases[0]).subjectType)"
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .font(.system(size: 15, weight: .bold))
            
            Text("Picker")
                .font(.system(size: 13, weight: .regular))
            
            OptionPicker(cases: cases.map(String.init(describing:)), selectedIndex: $selectedIndex)
        }
    }
}

private struct OptionPicker: View {
    let cases: [String]
    @State private var isPresented = false
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: { isPresented.toggle() }) {
            Text(cases[selectedIndex])
                .font(.system(size: 15, weight: .regular))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(8, corners: .allCorners)
        }
        .tint(.primary)
        .sheet(isPresented: $isPresented) {
            Picker("", selection: $selectedIndex) {
                ForEach(0..<cases.count, id:\.self) { index in
                    Text(cases[index]).tag(index)
                }
            }
            .pickerStyle(.wheel)
            .presentationDetents([.height(200)])
        }
    }
}

