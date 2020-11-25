users = [
    {username: "moana16", email: "moana@disneyprincess.com", password: "M0tunu1!"},
    {username: "tiana09", email: "tiana@disneyprincess.com", password: "Th38ay0u"},
    {username: "tink08", email: "tinkerbell@disneyfairies.com", password: "91x1eH0ll0w"},
    {username: "evilqueen14", email: "maleficent@disneyfairies.com", password: "!H0rn5"}
]

users.each do |user|
    User.create(user)
end

habits = [
    {name: "Wayfinding", date: "11/23/2020", description: "Practice to find Te Fiti", user_id: 1},
    {name: "Meditating", date: "10/30/2020", description: "To connect with Ancestors", user_id: 1},
    {name: "Baking", date: "11/14/2020", description: "Prepare for holiday feast", user_id: 2},
    {name: "Power Nap", date: "11/23/2020", description: "Scheduling down time", user_id: 2},
    {name: "Sewing", date: "12/11/2020", description: "Practice for making fairy gifts", user_id: 3},
    {name: "Adventure Planning", date: "11/23/2020", description: "Some forethought for adventures", user_id: 3},
    {name: "Journaling", date: "1/1/2020", description: "Get in touch with feelings", user_id: 4},
    {name: "Conjuration", date: "11/23/2020", description: "Increase magic ability", user_id: 4}
]

habits.each do |habit|
    Habit.create(habit)
end 
