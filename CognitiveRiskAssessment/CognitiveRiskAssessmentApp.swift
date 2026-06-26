import SwiftUI

@main
struct CognitiveRiskAssessmentApp: App {

    var body: some Scene {

        let input = CognitiveAssessmentInput(
            rl13dracehisp: 2,
            hh13dhshldnum: 2,
            age: 70,
            pc13up20stair: 1,
            pc13car20pnds: 1,
            pc13bendover: 1,
            pc13hvobovrhd: 1,
            cg13ofmemprob: 1,
            cg13ratememry: 3,
            mo13outhlp: 0,
            mo13beddev: 1,
            wb13offelche1: 3,
            wb13truestme3: 2,
            wb13agrwstmt1: 3
        )

        let probability = DementiaRiskModel().predict(input: input)

        print("----------------")
        print("Probability:")
        print(probability)
        print("Percentage:")
        print(Int(probability * 100))
        print("----------------")


        return WindowGroup {
            ContentView()
        }
    }
}
