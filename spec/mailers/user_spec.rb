require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'instructions' do
    let!(:user) { create(:user) }
    let(:mail) { UserMailer.user_password(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('ZPO your password')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['zpo@devdawidcwiek.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("Your password: #{user.password}")
    end
  end
end
