
    import SwiftUI

    struct ContentView: View {
        
        @State private var country = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
        @State private var correctAns = Int.random(in: 0...2) // we use correctAns variable at 2 place 1st to place as a statement in text and 2nd in flag tapped function to compaire whether user select the same value which is present in Title or not.
        @State private var showingScore = false
        @State private var scoreTitle = ""
        @State private var angle = 0.0
        @State private var inCorrect = false
        @State private var selectedNumber = 0
        @State private var score = 0
        @State private var isFade = false
     //   @State private var isCorrect = false
        
        var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                
                VStack{
                    
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                    
                    Text(country[correctAns])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black
                    )
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        // Showing screen = true and alert is present from this method
                        // we use number for 2 purose 1st- to present UI one by one through ForEach and 2nd is we pass the value of number which user select.
                        withAnimation{
                            self.flagTapped(number: number)}
                    
                                            
                    }){
                        Image(self.country[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                    .rotation3DEffect(.degrees(self.inCorrect && self.selectedNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.isFade && self.selectedNumber != number ? 0.25 : 1)
            //        .rotation3DEffect(.degrees(self.isCorrect && self.selectedNumber == number ? 90 : 0), axis: (x: 1, y: 0, z: 0))
                    }
                Spacer()
                    .alert(isPresented: $showingScore){
                        Alert(title: Text(scoreTitle), message: Text("Your score is: \(score)"), dismissButton: .default(Text("Continue")){
                            self.askQuestion() // After a attmept the flags and target value suffle.
                            })
                }

                Text("Your Score is : \(score)")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
            }
    
        }
    }
    
                // This function suffle the target value and flags
                func askQuestion() {
                    country.shuffle()
                    correctAns = Int.random(in: 0...2)
                    self.inCorrect = false
                    self.isFade = false
                  //  self.isCorrect = true
                }
                
                func flagTapped(number: Int){
                    
                    // We get number for UI button the value of button is = button selected by user from 0...2 and correctAns is random number btw 0..2( and if random number = number which is slected by user is same that means answer is correct.
                    
                    self.selectedNumber = number
                    if number == correctAns{
                        scoreTitle = "Correct"
                        self.inCorrect = true
                        score += 1
                        self.isFade = true
                        
                    }
                    else{
                        scoreTitle = "wrong"
                        score += 0
                  //      self.isCorrect = true
                    }
                    //call alert screen
            //        showingScore = true
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.showingScore = true
                    }
                }
            }

            struct ContentView_Previews: PreviewProvider {
                static var previews: some View {
                    ContentView()
                }
            }

