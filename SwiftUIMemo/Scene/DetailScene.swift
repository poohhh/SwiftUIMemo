//
//  DetailScene.swift
//  SwiftUIMemo
//
//  Created by Nayomi on 4/10/21.
//

import SwiftUI

struct DetailScene: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var showEditSheet = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(self.memo.content)
                            .padding()
                        
                        Spacer()
                    }
                    
                    Text("\(self.memo.insertDate, formatter: formatter)")
                        .padding()
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
            
            HStack {
                Button(action: {
                    self.showEditSheet.toggle()
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                .padding()
                .sheet(isPresented: $showEditSheet, content: {
                    ComposeScene(showComposer: self.$showEditSheet, memo: self.memo)
                        .environmentObject(self.store)
                        .environmentObject(KeyboardObserver())
                })
            }
        }
        .navigationBarTitle("메모 보기")
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo: Memo(content: "SwiftUI"))
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
