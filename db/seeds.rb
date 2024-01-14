# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
include FactoryBot::Syntax::Methods

User.destroy_all

user_1 = create(:user)
user_1_journal = create(:journal, user: user_1)
journal_entry_1 = create(:entry, journal: user_1_journal)