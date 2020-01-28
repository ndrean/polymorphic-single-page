puts 'cleaning'
Review.destroy_all
Book.destroy_all
Author.destroy_all
Genre.destroy_all
Country.destroy_all
User.destroy_all

puts 'creating'

5.times do
  u = User.create! name: Faker::Name.name
  c = Country.create! country: Faker::Nation.flag
  a = Author.create! name: Faker::Book.author, country: c #Country.find((i..l).to_a.sample)
  g = Genre.create! name: Faker::Book.genre
  b = Book.create! title: Faker::Book.title, author: a, genre: g
end

b1 = Book.first.id
bn = Book.count
u1 = User.first.id
un = User.count
a1 = Author.first.id
an = Author.count


(u1..u1+un-1).each do |iu|
  (b1..b1+bn-3).each do |ib|
    # on garde 2 book sans review
    Review.create!(reviewable: Book.find(ib), user:User.find(iu), comment: Faker::Quotes::Shakespeare.hamlet_quote )
  end
  (a1..a1+an-1).each do |ia|
    Review.create!(reviewable: Author.find(ia), user:User.find(iu), comment: Faker::Quotes::Shakespeare.hamlet_quote )
  end
end

puts 'done'
