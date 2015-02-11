
unless Rails.env.production?
	
	User.create!(name:  "Admining Man",
           email: "qwe@qwe.com",
           password:              "123123123",
           password_confirmation: "123123123",
           admin: true)

end
summary = "Test " * 120
(1..12).each do |n|
    Novel.create(
      title: "Novel: #{n}",
      summary: summary,
      user: User.first,
      picture: File.open("app/assets/images/seed/#{n}.png"),
      author: "AuthorL #{n}"
    ).tap do |novel|
    		(1..6).each do |i|
          content = Faker::Lorem.paragraphs(rand(50)).join("\n")
    			novel.chapters.create(
    					title: "Volume: 1, Chapter: #{i}",
    					content: content,
    				)
				end
			end

end
