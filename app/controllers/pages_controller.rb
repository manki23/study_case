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
    if  !(@contact)
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
  def admin
    @contacts = Contact.all
    @interests = Interest.all
    @contact_interests = ContactInterest.all
    @subs = NewsletterSubscriber.all
  end
  def update
    @interests = Interest.all
    @contact = Contact.find params[:id]
    if @contact
      if params[:name]
        @contact.update name: params[:name]
      end
      if params[:phone]
        @contact.update phone: params[:phone]
      end
      if params[:email]
        @contact.update email: params[:email]
      end
      if params[:newsletter_subscriber] && !(NewsletterSubscriber.exists?(subscriber_id: @contact.id))
        NewsletterSubscriber.update subscriber_id: @contact.id
      elsif !params[:newsletter_subscriber] && (NewsletterSubscriber.exists?(subscriber_id: @contact.id))
        @to_del = NewsletterSubscriber.find_by(subscriber_id: @contact.id)
        @to_del.destroy if @to_del
      end
      params[:multi].each do |one|
        if !(ContactInterest.exists?(contact_id: @contact.id, interest_id: one))
          ContactInterest.create(contact_id: @contact.id, interest_id: one)
        end
      end
    end
    redirect_to "/admin"
  end
  def delete
    @user = Contact.find(params[:user_id])
    @user.destroy
    redirect_to "/admin"
  end
end
