users = [
    {email: "moana@disneyprincess.com", username: "moana16", password: "M0tunu1!"},
    {email: "tiana@disneyprincess.com", username: "tiana09", password: "Th38ay0u"},
    {email: "tinkerbell@disneyfairies.com", username: "tink08", password: "91x1eH0ll0w"},
    {email: "maleficent@disneyfairies.com", username: "evilqueen14", password: "!H0rn5"}
]

users.each do |user|
    User.create(user)
end

habits = [
    {name: "Wayfinding", date: "23/11/2020", description: "Practice to find Te Fiti", user_id: 1},
    {name: "Meditating", date: "30/10/2020", description: "To connect with Ancestors", user_id: 1},
    {name: "Baking", date: "14/11/2020", description: "Prepare for holiday feast", user_id: 2},
    {name: "Power Nap", date: "23/11/2020", description: "Scheduling down time", user_id: 2},
    {name: "Sewing", date: "11/12/2020", description: "Practice for making fairy gifts", user_id: 3},
    {name: "Adventure Planning", date: "11/23/2020", description: "Some forethought for adventures", user_id: 3},
    {name: "Journaling", date: "1/1/2020", description: "Get in touch with feelings", user_id: 4},
    {name: "Conjuration", date: "23/11/2020", description: "Increase magic ability", user_id: 4}
]

habits.each do |habit|
    Habit.create(habit)
end 
