# Q1
'
A database where tables are linked via a system of primary
and foreign keys
'

# Q2
'
1:1 #one to one (rare, almost never used)
N:N  #many to many
1:N  #one to many
'

# Q5
'
SQL: Structured Query Language
'

# Q8
'
Active Record is what we call an Object-Relational Mapping.
It’s purpose is to map the instance variables of our
models in our Ruby program to the columns of the
corresponding tables in our SQL database
'

# Q9
'
A migration is a change in our database structure(its schema):
tables, columns or relations between tables
'

# Q10
'rake db:migrate'

# Q11
class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end
end

# Q12
class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publishing_year

      t.references :author, foreign_key: true
      t.timestamps
    end
  end
end

# Q13
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
  end
end

# Q14
class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :reading_date

      t.timestamps
    end
  end
end

# Q15
class AddCategoryToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category, :string
  end
end

# Q16
class Author
  has_many :books
  # Author.find(1).books  => [Book instance, Book instance...]
end

class Book
  belongs_to :author
  # Book.find(2).author   =>  Author instance of that book

  has_many :readings
  # Book.find(2).readings   =>  [Reading instance, Reading instance..]

  has_many :users, through: :readings
  # Book.find(2).users   =>  [User instance, User instance..]
end

class User
  has_many :readings
  # see above

  has_many :books, through: :readings # through must come after a has_many for that table
end

class Reading
  belongs_to :user
  belongs_to :book
end

# Q17
  # 1. Add your favorite author to the DB
    fav_author = Author.create(name: 'Brandon Sanderson')

  # 2. Get all authors
    Author.all

  # 3. Get author with id=8
    Author.find(8)

  # 4. Get author with name='Jules Verne', store it in a variable: jules
    jules = Author.find_by(name: 'Jules Verne')

  # 5. Get Jules Verne's books
    jules.books

  # 6. Create a new book '20000 Leagues under the Seas'. Store it in a variable: twenty_thousand
    twenty_thousand = Book.new(title: '20000 Leagues under the Seas', publishing_year: 1875, category: 'science-fiction')

  # 7. Add Jules Verne as this book's author
    twenty_thousand.author = jules
  # twenty_thousand.update(author: jules)

  # 8. Now save this book in the DB!
    twenty_thousand.save

# Q18
class Author
  validates :name, presence: true
  Author.new.save # => not save, because no name. Thank you validation.
end

# Q19
'NO, ABSOLUTELY NOT!'
