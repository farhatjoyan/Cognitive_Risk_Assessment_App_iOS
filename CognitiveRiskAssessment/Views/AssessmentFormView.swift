import SwiftUI

struct AssessmentFormView: View {

    //demographic variables
    @State private var age = 75
    @State private var householdSize = 1
    @State private var race = 1
    
    //physical variables
    @State private var pc13up20stair = 1
    @State private var pc13car20pnds = 1
    @State private var pc13bendover = 1
    @State private var pc13hvobovrhd = 1
    
    //memory and functio
    @State private var cg13ratememry = 3
    @State private var cg13ofmemprob = 3
    @State private var mo13outhlp = 1
    @State private var mo13beddev = 1
    
    //welbeing
    @State private var wb13offelche1 = 3
    @State private var wb13truestme3 = 3
    @State private var wb13agrwstmt1 = 3
    
    //button
    @State private var probability: Double? = nil


    var body: some View {

        NavigationStack {

            Form {
                
                AppHeaderView()

                Section {
                    
                    InputCard(title: "Age") {
                        
                        Stepper(
                            "\(age)",
                            value: $age,
                            in: 65...97
                        )
                        
                    }
                    
                    InputCard(title: "Race / Ethnicity"){
                        
                        
                        Picker("", selection: $race) {
                            
                            Text("White, non-Hispanic")
                                .tag(1)
                            
                            Text("Black, non-Hispanic")
                                .tag(2)
                            
                            Text("Other, non-Hispanic")
                                .tag(3)
                            
                            Text("Hispanic")
                                .tag(4)
                            
                            Text("More than one")
                                .tag(5)
                            
                            Text("Unknown / Prefer not to answer")
                                .tag(6)
                        }
                    }
                    
                    InputCard(title: "Number of people in household"){
                        
                        Picker(
                            "",
                            selection: $householdSize
                        ) {
                            
                            ForEach(1...12, id: \.self) { number in
                                
                                Text("\(number)")
                                    .tag(number)
                            }
                        }
                    }
                
                } header: {
                    
                    SectionHeaderView(
                        title: "Demographics",
                        icon: "person.fill",
                        color: AppColors.teal
                    )

                }
                
                Section {
                    
                    InputCard(title: "Able to walk up 20 stairs?"){
                        Picker(
                            "",
                            selection: $pc13up20stair
                        ) {
                            
                            Text("Yes")
                                .tag(1)
                            
                            Text("No")
                                .tag(2)
                        }
                    }
                    
                    InputCard(title:  "Able to carry 20 pounds?"){
                        Picker(
                            "",
                            selection: $pc13car20pnds
                        ) {
                            
                            Text("Yes")
                                .tag(1)
                            
                            Text("No")
                                .tag(2)
                        }
                    }
                    
                    InputCard(title: "Able to bend over?"){
                        
                        Picker(
                            "",
                            selection: $pc13bendover
                        ) {
                            
                            Text("Yes")
                                .tag(1)
                            
                            Text("No")
                                .tag(2)
                        }
                    }
                

                    InputCard(title: "Able to lift heavy objects overhead?"){
                        Picker(
                            "",
                            selection: $pc13hvobovrhd
                        ) {
                            
                            Text("Yes")
                                .tag(1)
                            
                            Text("No")
                                .tag(2)
                        }
                    }
                    
                } header: {
                    
                    SectionHeaderView(
                        title: "Physical Ability",
                        icon: "figure.walk",
                        color: AppColors.navy
                    )

                }
                
                Section {

                    InputCard(title: "Rate your memory"){
                        Picker(
                            "",
                            selection: $cg13ratememry
                        ) {
                            
                            Text("Excellent").tag(1)
                            Text("Very Good").tag(2)
                            Text("Good").tag(3)
                            Text("Fair").tag(4)
                            Text("Poor").tag(5)
                        }
                    }

                    
                    InputCard(title: "How often do memory problems interfere?"){
                        Picker(
                            "",
                            selection: $cg13ofmemprob
                        ) {
                            
                            Text("Every day").tag(1)
                            Text("Most days").tag(2)
                            Text("Some days").tag(3)
                            Text("Rarely").tag(4)
                            Text("Never").tag(5)
                        }
                    }

                    
                    InputCard(title: "Need help going outside?"){
                        Picker(
                            "",
                            selection: $mo13outhlp
                        ) {
                            
                            Text("Yes").tag(1)
                            Text("No").tag(2)
                        }
                    }


                    InputCard(title: "Use assistive device when getting out of bed?"){
                        Picker(
                            "",
                            selection: $mo13beddev
                        ) {
                            
                            Text("Every time").tag(1)
                            Text("Most times").tag(2)
                            Text("Sometimes").tag(3)
                            Text("Rarely").tag(4)
                            Text("Never").tag(5)
                        }
                    }
                } header: {
                    
                    SectionHeaderView(
                        title: "Memory & Function",
                        icon: "brain.head.profile",
                        color: AppColors.teal
                    )

                }
                
                
                Section {
                    
                    
                    InputCard(title: "How often do you feel cheerful?"){
                        Picker(
                            "",
                            selection: $wb13offelche1
                        ) {
                            
                            Text("Every day").tag(1)
                            Text("Most days").tag(2)
                            Text("Some days").tag(3)
                            Text("Rarely").tag(4)
                            Text("Never").tag(5)
                        }
                    }
                    
                    
                    InputCard(title: "\"I gave up improving my life\""){
                        Picker(
                            "",
                            selection: $wb13truestme3
                        ) {
                            
                            Text("Agree a lot").tag(1)
                            Text("Agree a little").tag(2)
                            Text("Agree not at all").tag(3)
                        }
                    }
                

                    InputCard(title: "\"I am able to make my own decisions\""){
                        Picker(
                            "",
                            selection: $wb13agrwstmt1
                        ) {
                            
                            Text("Agree a lot").tag(1)
                            Text("Agree a little").tag(2)
                            Text("Agree not at all").tag(3)
                        }
                    }
                    
                    
                } header: {
                    
                    SectionHeaderView(
                        title: "Wellbeing",
                        icon: "heart.fill",
                        color: AppColors.navy
                    )

                }
                
                
                Section {

                    PrimaryButton(title: "Estimate dementia probability") {
                        
                        let input = CognitiveAssessmentInput(

                            rl13dracehisp: Double(race),
                            hh13dhshldnum: Double(householdSize),
                            age: Double(age),

                            pc13up20stair: Double(pc13up20stair),
                            pc13car20pnds: Double(pc13car20pnds),
                            pc13bendover: Double(pc13bendover),
                            pc13hvobovrhd: Double(pc13hvobovrhd),

                            cg13ofmemprob: Double(cg13ofmemprob),
                            cg13ratememry: Double(cg13ratememry),
                            mo13outhlp: Double(mo13outhlp),
                            mo13beddev: Double(mo13beddev),

                            wb13offelche1: Double(wb13offelche1),
                            wb13truestme3: Double(wb13truestme3),
                            wb13agrwstmt1: Double(wb13agrwstmt1)
                        )


                        probability = DementiaRiskModel()
                            .predict(input: input)
                        
                    }
                    
                    if let probability = probability {

                        let percentage = Int((probability * 100).rounded())

                        Text("Estimated risk: \(percentage)%")
                            .font(.title)
                            .padding()

                    }

                }

            }
            .navigationTitle("Cognitive Assessment")
        }
    }
}
