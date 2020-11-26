# Testing Wine validations
require 'rails_helper'

RSpec.describe Wine, type: :model do
  subject {
    wine = Wine.new(name: "Test", description: "A test wine",
      image_url: "https://en.calameo.com/read/00388795647118aa4ae2a", variant: "Tinto",
      country: "Portugal", region: "Alentejo", volume: 12.5, maker: "Cartuxa")
  }

  before { subject.save }

  it "Name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "Name should be unique" do
    wine = Wine.new(name: "Test", description: "A test wine",
      image_url: "https://en.calameo.com/read/00388795647118aa4ae2a", variant: "Tinto",
      country: "Portugal", region: "Alentejo", volume: 12.5, maker: "Cartuxa")
    expect(wine).to_not be_valid
  end

  it "Description should be present" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "Country should be present" do
    subject.country = nil
    expect(subject).to_not be_valid
  end

  it "Region should be present" do
    subject.region = nil
    expect(subject).to_not be_valid
  end

  it "Volume should be present" do
    subject.volume = nil
    expect(subject).to_not be_valid
  end

  it "Variant should be included in Tinto, Branco, Rosé, Verde, Espumante or Sobremesa" do
    subject.variant = "azul"
    expect(subject).to_not be_valid
  end
end
