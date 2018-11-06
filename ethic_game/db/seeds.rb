# Water boiling seeds test sceneario database
# In the future users should have the means to fill this database themselves to create custom scenerios

# Create the sceneraio
desc = 'You are a member of a team of public relations officers assigned to a project. This project is a joint alliance between the US and Peruvian governments. Your role on this project tea is to provide public updates on this hight profile project --- a project that is costing the US and Peruvian governments LOTS of money.'
scenario = Scenario.create!(
    title: 'Water Boiling',
    description: desc,
    created_by: 'me'
    )
scenario2 = Scenario.create!(
    title: 'Test Scenario',
    description: 'Description',
    created_by: 'me'
    )

# Create the player
player = Player.create!(
    name: 'test_player'
    )

# Create the groups
# groupA
# groupB
groupC = Group.create!(
    name: 'Villager C', 
    population_percentage: 5,
    scenario_id: scenario.id
    )

# Initialize the player-group standings
pgs = PlayerGroupStanding.create!(
    player_id: player.id,
    group_id: groupC.id,
    current_standing: 50
    )

# Defaul Q/A
q0 = PossibleQuestion.create!(
    question: 'n/a',
    points: 0
    )
a0 = PossibleResponse.create!(
    response: 'n/a'
    )
    
qa = PossibleQuestionsResponse.create!(
    possible_question_id: q0.id,
    possible_response_id: a0.id
    )

# Initialize the state iteration
#history = PlayerHistory.create!(
#    scenario_id: scenario.id,
#    player_id: player.id,
#    group_id: groupC.id,
#    possible_question_id: q0.id,
#    possible_response_id: a0.id,
#    points: 0,
#    notes: 'default'
#    )

# Seeded questions and responses

q1 = PossibleQuestion.create!(
    question: 'Hello',
    points: 0
    )
a1 = PossibleResponse.create!(
    response: 'Hello'
    )
    
    
q2 = PossibleQuestion.create!(
    question: 'What is your name',
    points: 0
    )
a2 = PossibleResponse.create!(
    response: 'My name is <name>'
    )
    

q3 = PossibleQuestion.create!(
    question: 'Do you boil your water',
    points: 0
    )
a3 = PossibleResponse.create!(
    response: 'Yes'
    )

# Matches questions to responses

PossibleQuestionsResponse.create!(
    possible_question_id: q1.id,
    possible_response_id: a1.id
    )
    
PossibleQuestionsResponse.create!(
    possible_question_id: q2.id,
    possible_response_id: a2.id
    )
    
PossibleQuestionsResponse.create!(
    possible_question_id: q2.id,
    possible_response_id: a3.id
    )

# Apply them all to a group
GroupsPossibleQuestion.create!(
    group_id: groupC.id,
    possible_question_id: q1.id
    )
    
GroupsPossibleQuestion.create!(
    group_id: groupC.id,
    possible_question_id: q2.id
    )
    
GroupsPossibleQuestion.create!(
    group_id: groupC.id,
    possible_question_id: q3.id
    )

p "DB Seeded succesfully"
p scenario
p player
p groupC
p pgs
p q0
p a0
#p history