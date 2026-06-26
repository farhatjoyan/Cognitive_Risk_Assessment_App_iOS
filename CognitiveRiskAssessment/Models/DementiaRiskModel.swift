import Foundation

struct DementiaRiskModel {

    private let intercept = -2.31164569

    func predict(input: CognitiveAssessmentInput) -> Double {

        var score = intercept


        // ==================================================
        // CATEGORICAL FEATURES (OneHotEncoder drop="first")
        // ==================================================

        // rl13dracehisp
        // Reference category: 1.0
        score += 0.5143057826 * indicator(input.rl13dracehisp, equals: 2.0)
        score += 0.3650849019 * indicator(input.rl13dracehisp, equals: 3.0)
        score += 1.0234507403 * indicator(input.rl13dracehisp, equals: 4.0)
        score += 0.5497074951 * indicator(input.rl13dracehisp, equals: 5.0)
        score += 0.5615496583 * indicator(input.rl13dracehisp, equals: 6.0)


        // pc13up20stair
        score += -0.5000868508 * indicator(input.pc13up20stair, equals: 1.0)
        score += -0.2551006398 * indicator(input.pc13up20stair, equals: 2.0)


        // mo13outhlp
        score += 0.2734459499 * indicator(input.mo13outhlp, equals: 1.0)
        score += -0.0566772847 * indicator(input.mo13outhlp, equals: 2.0)


        // cg13ratememry
        score += -0.2101279648 * indicator(input.cg13ratememry, equals: 1.0)
        score += -0.7347854462 * indicator(input.cg13ratememry, equals: 2.0)
        score += -0.3378016597 * indicator(input.cg13ratememry, equals: 3.0)
        score += 0.0010139122 * indicator(input.cg13ratememry, equals: 4.0)
        score += 0.4641554199 * indicator(input.cg13ratememry, equals: 5.0)


        // pc13bendover
        score += 0.0705736709 * indicator(input.pc13bendover, equals: 1.0)
        score += 0.1741485117 * indicator(input.pc13bendover, equals: 2.0)


        // mo13beddev
        score += 0.0866389565 * indicator(input.mo13beddev, equals: 2.0)
        score += 0.0852560540 * indicator(input.mo13beddev, equals: 3.0)
        score += 0.0257731782 * indicator(input.mo13beddev, equals: 4.0)
        score += -0.1988279158 * indicator(input.mo13beddev, equals: 5.0)


        // wb13offelche1
        score += 0.4447985875 * indicator(input.wb13offelche1, equals: -7.0)
        score += -0.2413869190 * indicator(input.wb13offelche1, equals: 1.0)
        score += -0.5475729530 * indicator(input.wb13offelche1, equals: 2.0)
        score += -0.4023821723 * indicator(input.wb13offelche1, equals: 3.0)
        score += -0.4080689197 * indicator(input.wb13offelche1, equals: 4.0)
        score += -0.2178293613 * indicator(input.wb13offelche1, equals: 5.0)


        // pc13hvobovrhd
        score += -0.2877162635 * indicator(input.pc13hvobovrhd, equals: 1.0)
        score += 0.0732282711 * indicator(input.pc13hvobovrhd, equals: 2.0)


        // pc13car20pnds
        score += -0.7968334630 * indicator(input.pc13car20pnds, equals: 1.0)
        score += -0.5069294827 * indicator(input.pc13car20pnds, equals: 2.0)


        // wb13truestme3
        score += 0.6025086369 * indicator(input.wb13truestme3, equals: -7.0)
        score += -0.0835027585 * indicator(input.wb13truestme3, equals: 1.0)
        score += -0.0210037813 * indicator(input.wb13truestme3, equals: 2.0)
        score += -0.3434388183 * indicator(input.wb13truestme3, equals: 3.0)



        // ==================================================
        // NUMERIC FEATURES
        // ==================================================

        score += -0.1035227776 * input.cg13ofmemprob
        score += 0.0311192295 * input.hh13dhshldnum
        score += 0.0467585165 * input.age
        score += -0.1918377384 * input.wb13agrwstmt1



        // ==================================================
        // SIGMOID FUNCTION
        // ==================================================

        let probability = 1.0 / (1.0 + exp(-score))

        return probability
    }


    // Helper function for one-hot encoding
    private func indicator(_ value: Double, equals category: Double) -> Double {
        return value == category ? 1.0 : 0.0
    }
}
