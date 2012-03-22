RSpec::Matchers.define :have_icon do |icon_name|
  match do |object|
    if not object.respond_to?(icon_name)
      @explanation = "doesn't respond to :#{icon_name} method"
    elsif not File.exists?(object.send(icon_name))
      @explanation = "file '#{object.send(icon_name)}' doesn't exist"
    end

    not @explanation
  end

  failure_message_for_should do
    "expected to have icon '#{icon_name}', but #{@explanation}"
  end

  failure_message_for_should_not do
    "expected to have no icon '#{icon_name}'"
  end

  description do
    "have icon '#{icon_name}'"
  end
end
