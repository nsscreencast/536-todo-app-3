//
//  TodoList.swift
//  SimpleTodo
//
//  Created by Ben Scheirman on 7/29/22.
//

import SwiftUI

struct TodoList: View {
    @Binding var todos: [Todo]
    @FocusState var focusedTodoID: UUID?

    var body: some View {
        ZStack {
            List($todos) { $todo in
                TodoRow(todo: $todo)
                    .listRowSeparator(.hidden)
                    .focused($focusedTodoID, equals: todo.id)
            }
            .scrollDismissesKeyboard(.immediately)
            .listStyle(.plain)

            Button(action: {
                let newTodo = Todo("")
                withAnimation {
                    todos.insert(newTodo, at: 0)
                    focusedTodoID = newTodo.id
                }
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(
                        Circle().fill(Color.accentColor)
                    )
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom)
        }
    }
}


struct TodoList_Previews: PreviewProvider {
    struct DemoView: View {
        @State var todos = [Todo].sample
        var body: some View {
            TodoList(todos: $todos)
        }
    }
    static var previews: some View {
        DemoView()
    }
}
