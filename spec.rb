# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

require "rspec/autorun"

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    [@first_name, @middle_name, @last_name].compact.join(" ")
  end

  def full_name_with_middle_initial
    [@first_name, @middle_name ? @middle_name[0] : nil, @last_name].compact.join(" ")
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(
        first_name: "Daniel",
        middle_name: "Mark",
        last_name: "Tuppen"
      )

      expect(person.full_name).to eq("Daniel Mark Tuppen")
    end
    it "does not add extra spaces if middle name is missing" do
      person = Person.new(
        first_name: "Daniel",
        last_name: "Tuppen"
      )

      expect(person.full_name).to eq "Daniel Tuppen"
    end
  end

  describe "#full_name_with_middle_initial" do
    it "show full name with middle initial and spaces" do
      person = Person.new(
        first_name: "Daniel",
        middle_name: "Mark",
        last_name: "Tuppen"
      )

      expect(person.full_name_with_middle_initial).to eq("Daniel M Tuppen")
    end
  end

  describe "#initials"
end
