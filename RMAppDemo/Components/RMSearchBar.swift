//
//  RMSearchBar.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct RMSearchBar: View {
    
    var title: String
    @State var text: String
    var placeholder: String
    var onChange: ((String) -> ())?
    
    init(title: String, text reference: String, onChange: @escaping (String) -> Void, placeholder: String = "") {
        self.title = title
        self.text = reference
        self.placeholder = placeholder
        self.onChange = onChange
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2, content: {
            Text(title)
                .frame(width: 250, height: 18, alignment: .leading)
            TextField(placeholder, text: $text)
                .frame(width: 250, height: 40)
                .background(.baseBG)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.theme, lineWidth: 2)
                )
                .onChange(of: text, perform: { _ in
                    onChange?(text)
                })
        })
        .frame(width: 250, height: 80)
    }
    
}

#Preview {
    RMSearchBar(title: "Search by", text: "", onChange: { _ in
        //
    })
}
