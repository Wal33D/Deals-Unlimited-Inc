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
attribute :time_at_job,    :validate => true
attribute :income,    :validate => true
attribute :prev_employer,    :validate => true
attribute :prev_position,    :validate => true
attribute :time_at_last_job,    :validate => true
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
attribute :email_2,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

attribute :name_2,      :validate => true
attribute :employer_2,    :validate => true
attribute :employer_addr_2,    :validate => true
attribute :employer_phone_2,    :validate => true
attribute :curr_pos_2,    :validate => true
attribute :time_at_job_2,    :validate => true
attribute :income_2,    :validate => true
attribute :prev_employer_2,    :validate => true
attribute :prev_position_2,    :validate => true
attribute :time_at_last_job_2,    :validate => true
attribute :other_income_2,    :validate => true
attribute :other_income_source_2,    :validate => true
attribute :middle_initial_2,      :validate => true
attribute :last_name_2,      :validate => true
attribute :street_address_2,      :validate => true
attribute :state_2,      :validate => true
attribute :dob_2,      :validate => true
attribute :ssn_2,      :validate => true
attribute :res_status_2,      :validate => true
attribute :rent_2,      :validate => true
attribute :prev_addr_2,      :validate => true
attribute :phone_2,      :validate => true
attribute :prev_addr_time_2,      :validate => true


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Credit Application",
      :to => "dealsunlimitedinc@live.com",
      :from => %("#{name} #{last_name}" <#{email}>)
    }
  end
end
