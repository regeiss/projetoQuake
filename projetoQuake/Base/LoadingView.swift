//
//  LoadingView.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 21/06/22.
//

import SwiftUI

struct LoadingView: View
{
    
    let text: String
    
    var body: some View
    {
        VStack(spacing: 8)
        {
            ProgressView()
            Text(text)
        }
    }
}

struct LoadingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoadingView(text: "Loading...")
            .preview(displayName: "Loading View")
    }
}
