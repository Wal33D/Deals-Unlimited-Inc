class Credit < MailForm::Base
attribute :name,      :validate => true
attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
attribute :nickname,  :captcha  => true
attribute :year,      :validate => true
attribute :model,      :validate => true
attribute :make,      :validate => true
attribute :vin,      :validate => true
attribute :employer,    :validate => true
attribute :employer_addr,    :validate => true
attribute :employer_phone,    :validate => true
attribute :curr_pos,    :validate => true
attribute :toj,    :validate => true
attribute :income,    :validate => true
attribute :prev_employer,    :validate => true
attribute :prev_position,    :validate => true
attribute :toj_l,    :validate => true
attribute :other_income,    :validate => true
attribute :other_income_source,    :validate => true
attribute :middle_initial,      :validate => true
attribute :last_name,      :validate => true
attribute :street_address,      :validate => true
attribute :state,      :validate => true
attribute :dob,      :validate => true
attribute :ssn,      :validate => true
attribute :res_status,      :validate => true
attribute :rent,      :validate => true
attribute :prev_addr,      :validate => true
attribute :phone,      :validate => true
attribute :prev_addr_time,      :validate => true
attribute :tradein_year
attribute :tradein_make
attribute :tradein_model
attribute :tradein_mileage
attribute :tradein_options
attribute :tradein_condition
attribute :damage
attribute :paidoff
attribute :paidoff_est
attribute :transfer
attribute :down_payment
attribute :howmuch
attribute :tradein
attribute :tel
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Credit Application",
      :to => "aquataze91@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
