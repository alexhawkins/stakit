module StacksHelper
  def render_supplements_for(stacks)
    output = ""
    array = stacks.collect(&:supplements).flatten.uniq
    array.each do | supplement |        
      output += "<li><a href='#'>#{supplement.name}</a></li>"
    end
    output
  end

  def render_privacy_for(stack)
    output = ""
    if stack
      output += "public"
    else
      output += "private"
    end
  end
end
