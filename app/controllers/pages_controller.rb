class PagesController < ApplicationController
  def index
    @contacts = Contact.all
    @interests = Interest.all
    @contact_interests = ContactInterest.all
    @subs = NewsletterSubscriber.all
  end

  def home
  end

  def new
    @interests = Interest.all
  end

  def create
    @interests = Interest.all
    if not @contact
      @contact = Contact.create(name: params[:name], phone: params[:phone], email: params[:email])
      if params[:newsletter_subscriber]
        NewsletterSubscriber.create(subscriber_id: @contact.id)
      end
        params[:multi].each do |one|
          ContactInterest.create(contact_id: @contact.id, interest_id: one)
        end
    end
    if @contact.errors.first
      render :new
    else
      render :home
    end
  end
end
