require 'rails_helper'

RSpec.describe User, type: :model do
    describe "factory" do
        context "when using standard user factory" do
            it {expect(build(:user)).to be_valid}
        end
        
        context "user is not admin" do
            it {expect(build(:user).admin).to be false}
        end
        
        context "user is admin" do
            it {expect(build(:admin).admin).to be true}
        end

        context "when using admin user factory" do
            it {expect(build(:admin)).to be_valid}
        end
        
    end
    
    describe "validations" do
        context "user has no email" do
            it {expect(build(:user, email: nil)).to be_invalid}
        end
        
        context "user has no username" do
            it {expect(build(:user, username: nil)).to be_invalid}
        end
        
        context "user has no password" do
            it {expect(build(:user, password: nil,
                password_confirmation: nil)).to be_invalid}
        end

        context "password is too short" do
            it {expect(build(:user, password: '123', password_confirmation: '123')).to be_invalid}
        end
        
        context "password confirmation doesn't match" do
            it {expect(build(:user, password: '12345678',
                 password_confirmation: '1234567')).to be_invalid}
        end
        
        context "email is not unique" do
            before do
                create(:user, email: 'teste@teste.com')
            end

            it {expect(build(:user, email: 'teste@teste.com')).to be_invalid}
        end
        
    end
    
end
