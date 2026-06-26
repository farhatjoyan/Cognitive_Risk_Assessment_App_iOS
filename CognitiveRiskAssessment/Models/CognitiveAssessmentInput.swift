import Foundation

struct CognitiveAssessmentInput {

    // Demographics
    var rl13dracehisp: Double
    var hh13dhshldnum: Double
    var age: Double

    // Physical Ability
    var pc13up20stair: Double
    var pc13car20pnds: Double
    var pc13bendover: Double
    var pc13hvobovrhd: Double

    // Memory & Function
    var cg13ofmemprob: Double
    var cg13ratememry: Double
    var mo13outhlp: Double
    var mo13beddev: Double

    // Wellbeing
    var wb13offelche1: Double
    var wb13truestme3: Double
    var wb13agrwstmt1: Double
}
