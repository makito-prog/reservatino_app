User.create(name: "Taro", email: "taro@example.com")
User.first.reservations.create(date: "2024-11-21 15:00", content: "ミーティング")
