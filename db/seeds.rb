# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
survey = Survey.create(title: "Initial Survey", 
            description: "This is your initial survey. Please answer the questions listed on a scale of 1 - 5.",
            is_active: :true)

Question.create(content: "How would you rate your attention span?", survey: survey)
Question.create(content: "How would you rate your ability to multitask?", survey: survey)
Question.create(content: "Would you describe yourself as a tech addict?", survey: survey)
Question.create(content: "Would you describe yourself as forgetful?", survey: survey)
Question.create(content: "How would you rate your face-to-face interactions?", survey: survey)