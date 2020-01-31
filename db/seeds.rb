puts 'cleaning'
Review.destroy_all
Book.destroy_all
Author.destroy_all
Genre.destroy_all
Country.destroy_all
User.destroy_all

puts 'creating'

a,g =  [],[];
5.times do
  u = User.create! name: Faker::Name.name
  c = Country.create!( name: Faker::Nation.flag)
  a << Author.create!(name: Faker::Book.author, country: c) #Country.find((i..l).to_a.sample)
  g << Genre.create!( name: Faker::Book.genre)
end

a.each do |aa|
  5.times do
    Book.create! title: Faker::Book.title, author: aa, genre: g.sample
  end
end 




b1 = Book.first.id
bn = Book.count
u1 = User.first.id
un = User.count
a1 = Author.first.id
an = Author.count

arr = []
50.times do
  arr << Faker::Music.album
end

(u1..u1+un-1).each do |iu|
  (b1..b1+bn-5).each do |ib|
    # on garde 4 book sans review
    Review.create!(reviewable: Book.find(ib), user:User.find(iu), comment: arr.sample )
  end
  (a1..a1+an-1).each do |ia|
    Review.create!(reviewable: Author.find(ia), user:User.find(iu), comment: arr.sample )
  end
end

puts 'done'
