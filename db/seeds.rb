# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create email: "test@test.com", password: 'test'
categories = Category.create [
  {name: 'Programming'},
  {name: 'TV'},
  {name: 'Music'},
  {name: 'Travel'},
  {name: 'other'}
  ]
articles = Article.create [
    {title: "Omega Rom", body: "mejor custom rom para android", published_at: '2014-05-20'},
    {title: "Custom Rom", body: "personaliza tu android", published_at: Time.now},
    {title: "xda-developers", body: "foro de freaks", published_at: 20.months.ago},
    {title: "Borrador", body: "articulo en desarrollo"}
  ]  
user.articles << articles
user.articles.find(1).categories << Category.find_by_name('Programming')

article = user.articles.first
article.comments.create name:"invitado", email:"invitado@test.com", body: "artículo estupendo"
article = user.articles.last
2.times {|n| article.comments.create! name: "invitado #{n}", email: "invitado#{n}@test.com", body: "muy bueno invitado #{n}"}

  
