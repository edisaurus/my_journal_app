require 'rails_helper'

RSpec.describe Category, type: :model do

    it {expect(described_class.new).to validate_presence_of :name }
    it {expect(described_class.new).to validate_presence_of :description }
    it {expect(described_class.new).to validate_presence_of :date_created }
    it {expect(described_class.new).to validate_length_of :description }

end