require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {
    described_class.new(name: "Arthur",
                        email: "arthur1606@gmail.com",
                        password: "11aaAA@@asdfgh",
                        password_confirmation: "11aaAA@@asdfgh")
  }

  describe "validations" do
    context "#valid?" do
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    end

    context "#invalid?" do
      context "verify name field" do
        it "is not valid without a name" do
          subject.name = nil
          expect(subject).to_not be_valid
        end

        it "has valid length" do
          expect(subject.name).to have_attributes(size: (be >= 5) & (be <= 128))
        end
      end

      context "verify email field" do
        it "is not valid without an email" do
          subject.email = nil
          expect(subject).to_not be_valid
        end

        it "has valid length" do
          expect(subject.email).to have_attributes(size: (be <= 20))
        end
      end

      context "verify password field" do
        it "is not valid without a password" do
          subject.password = nil
          expect(subject).to_not be_valid
        end

        it "has valid length" do
          expect(subject.password).to have_attributes(size: (be >= 10) & (be <= 128))
        end
      end

      context "verify password_confirmation field" do
        it "is not valid without a password_confirmation" do
          subject.password_confirmation = nil
          expect(subject).to_not be_valid
        end

        it "has valid length" do
          expect(subject.password_confirmation).to have_attributes(size: (be >= 10) & (be <= 128))
        end
      end
    end
  end
end