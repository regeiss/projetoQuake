//
//  QuakeView.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 23/06/22.
//
import SwiftUI

struct QuakeView: View
{
    let item: Quake
     
    var body: some View
    {
        VStack(alignment: .leading, spacing: 8)
        {
             Text(makeAttributedString(title:"magnitude", label:String(item.magnitude)))
             Text(makeAttributedString(title:"lugar", label: item.place))
            Text(makeAttributedString(title:"hora", label: item.time.formatted()))
         }
         .padding()
         .foregroundColor(.black)
    }
    
    private func makeAttributedString(title: String, label: String) -> AttributedString
    {
        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .label
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label)
        {
            string[range].foregroundColor = .systemGray
            string[range].font = .system(size: 16, weight: .regular)
        }
        return string
    }
}

struct QuakeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        QuakeView(item: Quake.dummyData.first!)
            .preview(displayName: "Quake View")
    }
}

