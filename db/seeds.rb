require 'csv'
require 'faker'

CATEGORIES = ["restaurant", "expérience", "les deux (expérience + restaurant)"]
CITIES = Experience::CITY
TIME_SLOTS = ["en aprem", "en soirée"]
BUDGETS = [150, 200, 250, 300, 350, 400, 450, 500]
PREF_LEVELS = [1, 2]

# ---------------------- DELETE -----------------------------------

puts "Deleting message..."
Message.destroy_all
puts "Done"
puts "Deleting experience slices..."
ExperienceSlice.destroy_all
puts "Done"
puts "Deleting activities..."
Activity.destroy_all
puts "Done"
puts "Deleting preferences categories..."
ExperiencePreferencesCategory.destroy_all
puts "Done"
puts "Deleting experiences..."
Experience.destroy_all
puts "Done"
puts "Deleting users..."
User.destroy_all
puts "Done"
puts "Deleting categories..."
Category.destroy_all
puts "Done"
puts "Deleting message types..."
MessageType.destroy_all
puts "Done"


# ---------------------- CREATE -----------------------------------

puts "Creating categories..."
CATEGORIES.each do |category|
  Category.create!(name: category)
end
puts "Done"

puts "Creating activities..."
file_path = File.dirname(__FILE__) + "/seeds.csv"
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

CSV.foreach(file_path, csv_options) do |row|
  activity = Activity.create!({
    name: row["Name"],
    meeting_point: row["Meeting point"],
    duration: row["Duration"],
    city: row["City"],
    price: row["Price"],
    category: Category.find_by(name: row["Category"]),
    teasing1: row["teasing1"],
    teasing2: row["teasing2"],
    instruction: row["Instruction"]
  })
end
puts "Done"


puts "Creating admins..."
User.create!(email:"fanch.capel@gmail.com",password:"FanchGingerAdmin",password_confirmation:"FanchGingerAdmin", primary_number: '0795360618',secondary_number: '0795360618', admin: true, primary_first_name: "Francois", primary_last_name: "Capel")
puts "Done"

# ---------------------- CREATE MESSAGE FOR PRODUCTION (SCROLL FOR DEMO)-----------------------------------

puts "Creating message types..."
# Message 1
@messageType = MessageType.new
@messageType.message_type = "Day before"
@messageType.day = -1
@messageType.send_at = DateTime.parse('18:00:00')
@messageType.content = "'Bonjour! Je suis Ginger, votre majordome en charge de votre expérience que vous avez réservé ce' + message.experience.date.strftime(\'%d %m %y\') + '. Je vous donne donc rendez-vous à cette date à 18:30 ' + message.experience.experience_slices.activity.meeting_point + ' . Ne pas oubliez pas de charger votre téléphone et de vous équiper en cas de pluie! A très bientôt pour de nouvelles instructions, Ginger.'"
@messageType.save!

# Message 2
@messageType = MessageType.new
@messageType.message_type = "Teasing1"
@messageType.day = 0
@messageType.send_at = DateTime.parse('12:00:00')
@messageType.content = 'message.experience.experience_slice.activity.teasing1'
@messageType.save!

# Message 3
@messageType = MessageType.new
@messageType.message_type = "Teasing2"
@messageType.day = 0
@messageType.send_at = DateTime.parse('15:00:00')
@messageType.content = 'message.experience.experience_slice.activity.teasing2'
@messageType.save!

# Message 4
@messageType = MessageType.new
@messageType.message_type = "Welcome"
@messageType.day = 0
@messageType.send_at = DateTime.parse('18:30:00')
@messageType.content = 'message.experience.experience_slice.activity.instruction'
@messageType.save!

# # Message 5
# @messageType = MessageType.new
# @messageType.message_type = "End of exp 1"
# @messageType.day = 0
# @messageType.send_at = DateTime.parse('19:30:00')
# @messageType.content = "'Prêts pour la suite?' + message.experience.experience_slice.find_by_order(2).activity.instruction}'"
# @messageType.save!

# # Message 6
# @messageType = MessageType.new
# @messageType.message_type = "End of exp 2"
# @messageType.day = 0
# @messageType.send_at = DateTime.parse('20:30:00')
# @messageType.content = "'Ce n\'est pas fini!' + message.experience.experience_slice.find_by_order(3).activity.teasing1'"
# @messageType.save!

# Message 7
@messageType = MessageType.new
@messageType.message_type = "End"
@messageType.day = 0
@messageType.send_at = DateTime.parse('18:30:00')+ Rational(message.experience.experience_slice.activity.duration, 1440)
@messageType.content = 'Votre expérience se termine! J espère que vous avez aprécié? Merci de répondre à ce petit questionnaire pour nous aider à nous améliorer: <Link to form: https//forms.gle/R6DCLq5W6KNK6dnb7>. Il est maintenant temps pour moi de vous dire au revoir, en espérant vous revoir bientôt! Votre majordome, Ginger'
@messageType.save!
puts "Done"


# ---------------------- CREATE MESSAGE FOR DEMO-----------------------------------


# puts "Creating message types..."
# # Message 1
# @messageType = MessageType.new
# @messageType.message_type = "Day before"
# @messageType.day = 1
# @messageType.content = "'Bonjour! Je suis Ginger, votre majordome en charge de votre expérience que vous avez réservé ce ' + message.experience.date.strftime(\'%A %d %B\') + '. Je vous donne donc rendez-vous demain à 18:30 à ' + message.experience.experience_slices.find_by_order(1).activity.meeting_point + ' . N oubliez pas de charger votre téléphone et de vous équiper en cas de pluie! A très bientot pour de nouvelles instructions, Ginger.'"
# @messageType.save!

# # Message 2
# @messageType = MessageType.new
# @messageType.message_type = "Teasing1"
# @messageType.day = 2
# @messageType.content = "message.experience.experience_slices.find_by_order(1).activity.teasing1"
# @messageType.save!

# Message 3
# @messageType = MessageType.new
# @messageType.message_type = "Teasing2"
# @messageType.day = 3
# @messageType.content = "message.experience.experience_slices.find_by_order(3).activity.teasing2"
# @messageType.save!

# # Message 4
# @messageType = MessageType.new
# @messageType.message_type = "Welcome"
# @messageType.day = 3
# @messageType.content = "'Bienvenue! Si Monsieur Dame veulent bien se donner la peine: ' + message.experience.experience_slices.find_by_order(1).activity.instruction"
# @messageType.save!

# # Message 5 : ne fonctionne pas (pas reçu)
# @messageType = MessageType.new
# @messageType.message_type = "End of exp 1"
# @messageType.day = 5
# @messageType.content = "'Prêts pour la suite?' + message.experience.experience_slices.find_by_order(2).activity.instruction}'"
# @messageType.save!

# # # Message 6 (pas reçu)
# @messageType = MessageType.new
# @messageType.message_type = "End of exp 2"
# @messageType.day = 6
# @messageType.content = "'Ce n est pas fini!' + message.experience.experience_slices.find_by_order(3).activity.instruction'"
# @messageType.save!

# # Message 7 (pas reçu)
# @messageType = MessageType.new
# @messageType.message_type = "End"
# @messageType.day = 7
# @messageType.content = "Votre expérience touche à sa fin! Il est temps pour moi de vous souhaiter une bonne fin d expérience, en souhaitant vous revoir bientôt! Votre majordome, Ginger"
# @messageType.save!

# puts "Done"
