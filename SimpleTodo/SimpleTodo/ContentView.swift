import SwiftUI

struct ContentView: View {
    @State var todos = [Todo].sample

    var body: some View {
        TodoList(todos: $todos)
            .onChange(of: todos) { newValue in
                print(newValue)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
