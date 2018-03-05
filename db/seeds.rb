# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
new_users = [
  { name: "Ms. Friz",
    email: "thefriz@test.com",
    password: "testtest",
    role: "teacher",
    current_grade: 6
  },
  { name: "The Fonz",
    email: "thefonz@test.com",
    password: "testtest",
    role: "teacher",
    current_grade: 7
  },
  { name: "Mr. Feeny",
    email: "feeny@test.com",
    password: "testtest",
    role: "teacher",
    current_grade: 8
  },
  { name: "Arnold",
    email: "arnold@test.com",
    password: "testtest",
    role: "student",
    current_grade: 6
  },
  { name: "Carlos",
    email: "carlos@test.com",
    password: "testtest",
    role: "student",
    current_grade: 7
  },
  { name: "Wanda",
    email: "wanda@test.com",
    password: "testtest",
    role: "student",
    current_grade: 8
  },
  { name: "mom",
    email: "mom@test.com",
    password: "testtest",
    role: "admin",
    current_grade: 6
  },
  { name: "dad",
    email: "dad@test.com",
    password: "testtest",
    role: "admin",
    current_grade: 7
  },
  { name: "principal",
    email: "principal@test.com",
    password: "testtest",
    role: "admin",
    current_grade: 8
  }
]

new_users.each do |user_info|
  User.create(user_info)
end

new_study_sessions = [
  { subject: 'science',
    grade: 6,
    user_id: 1,
    date: '3/4/2018',
    time: '8:15'
  },
  { subject: 'math',
    grade: 7,
    user_id: 2,
    date: '3/4/2018',
    time: '8:15'
  },
  { subject: 'english',
    grade: 8,
    user_id: 3,
    date: '3/4/2018',
    time: '8:15'
  }
]

new_study_sessions.each do |session_info|
  StudySession.create(session_info)
end
