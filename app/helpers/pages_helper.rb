module PagesHelper
  def display_interests contact_interests, interests, contact
    count = 0
    res = ""
    contact_interests.each do |c_i|
      if c_i.contact_id == contact.id && interests.exists?(c_i.interest_id)
        res += ",  " if count != 0
        res += "[" + @interests.find(c_i.interest_id).name + "]"
        count += 1
      end
    end
    res
  end
end
