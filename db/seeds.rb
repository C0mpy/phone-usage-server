# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

survey1 = Survey.create!(
    title: "This is the inital Survey deployed to mobile devices.", 
    description: "Please answer questions on a scale 1 - 5", 
    start_time: Date.new(2019, 8, 10), 
    end_time: Date.new(2025, 8, 25))
    
Question.create(content: "How would you rate your quality of sleep?", survey: survey1)
Question.create(content: "How would you rate your attention span?", survey: survey1)

survey2 = Survey.create(
    title: "Survey from rails server.", 
    description: "This is your initial survey. Please answer the questions listed on a scale of 1 - 5.",
    start_time: Date.new(2019, 10, 10),
    end_time: Date.new(2025, 12, 15)
)

Question.create(content: "How would you rate your ability to multitask?", survey: survey2)
Question.create(content: "Would you describe yourself as a tech addict?", survey: survey2)

survey3 = Survey.create(
    title: "Future Survey, still in the making", 
    description: "This survey is not finished yet...",
    start_time: Date.new(2025, 12, 30), 
    end_time: Date.new(2030, 2, 10))

Question.create(content: "Would you describe yourself as forgetful?", survey: survey3)
Question.create(content: "How would you rate your face-to-face interactions?", survey: survey3)