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
    @contact_interests = ContactInterest.all
    if Contact.exists? params[:id]
      @contact = Contact.find params[:id]
      @save_name = @contact.name
      @save_phone = @contact.phone
      @save_email = @contact.email
      if params[:name]
        @save_name = params[:name]
        @contact.update name: params[:name], phone: @save_phone, email: @save_email
      end
      if params[:phone]
        @save_phone = params[:phone]
        @contact.update name: @save_name, phone: params[:phone], email: @save_email
      end
      if params[:email]
        @save_email = params[:email]
        @contact.update name: @save_name, phone: @save_phone, email: params[:email]
      end
      if params[:newsletter_subscriber] && !(NewsletterSubscriber.exists?(subscriber_id: params[:id]))
        NewsletterSubscriber.create subscriber_id: params[:id]
      elsif !params[:newsletter_subscriber] && (NewsletterSubscriber.exists?(subscriber_id: params[:id]))
        @to_del = NewsletterSubscriber.find_by(subscriber_id: params[:id])
        @to_del.destroy
      end
      if params[:delete_old_interests]
        @contact_interests.each do |one|
          if one.contact_id == @contact.id
            one.destroy
          end
        end
      end
      if params[:multi]
        params[:multi].each do |one|
          if !(ContactInterest.exists?(contact_id: @contact.id, interest_id: one))
            ContactInterest.create(contact_id: @contact.id, interest_id: one)
          end
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
  def pie_chart
    @interests = Interest.all
    @contact_interests = ContactInterest.all
  end

end
