def create_or_update(instance, picture_info)
  case instance.class.to_s
  when "Storyline"
    db_instance = Storyline.find_by(title: instance.title)
  when "Place"
    db_instance = Place.find_by(name: instance.name, storyline: instance.storyline)
  when "Riddle"
    db_instance = Riddle.find_by(title: instance.title, place: instance.place)
  when "User"
    db_instance = User.find_by(email: instance.email)
  when "Clue"
    db_instance = Clue.find_by(content: instance.content)
  else
    p "No case for class instance \"#{instance.class.to_s}\""
  end

  if db_instance.nil?
    picture = URI.open(picture_info[:url])
    instance.photo.attach(io: picture, filename: picture_info[:filename], content_type: picture_info[:content_type])
    instance.save!
    return instance
  else
    db_instance.attributes = instance.attributes.except('id', 'created_at', 'updated_at', 'longitude', 'latitude')
    db_instance.save!
    return db_instance
  end
end
