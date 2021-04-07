require 'rails_helper'

RSpec.describe Task, type: :model do

    it { expect(described_class.new).to validate_presence_of :name }
    it { expect(described_class.new).to validate_presence_of :description }
    it { expect(described_class.new).to validate_presence_of :start_date }
    it { expect(described_class.new).to validate_presence_of :end_date }
    it { expect(described_class.new).to validate_presence_of :accomplished }
    it { expect(described_class.new).to validate_length_of :description }
    
end