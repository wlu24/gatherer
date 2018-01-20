# expect(actual_value).to be_of_size(expected_value)
# e.g.    expect(project).to be_of_size(10)

RSpec::Matchers.define :be_of_size do |expected|
  match do |actual|
    # actual.size == expected

    size_to_check = @incomplete ? actual.remaining_size : actual.size
    size_to_check == expected
  end

  description do
    "have tasks totaling #{expected} points"
  end

  failure_message do |actual|
    "expected project #{actual.name} to have size #{expected}, was #{actual.size}"
  end

  failure_message_when_negated do |acutal|
    "expected project #{actual.name} not to have size #{expected}, but it did"
  end

  # Typically, inside a chained method you set instance variables, which are
  # then referenced inside the match method to affect the match. The
  # for_incomplete_tasks_only method sets a flag used to determine how to query 
  # the project for the size being tested.
  #
  # e.g. expect(project).to be_of_size(5).for_incomplete_tasks_only
  chain :for_incomplete_tasks_only do
    @incomplete = true
  end
end
