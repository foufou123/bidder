FactoryGirl.define do

  factory :user do
    password "password"

    factory :job_creator do
      email "mycabinetsneedfixing@example.com"
      password "password"
    end

    factory :contractor_user do
      email "contractor1user@example.com"
      password "password"
    end

    factory :competitor_user do
      email "contractor2user@example.com"
      password "password"
    end
  end

  factory :contractor do
    organization_type "Cabinetry"

    factory :good_contractor do
      user factory: :contractor_user
      organization_name "Awesome Cabinets Co"
      summary "We build awesome custom kitchen cabinets"
    end

    factory :competitor_contractor do
      user factory: :competitor_user
      organization_name "Shoddy Cabinets Co"
      summary "We build quickly and bounce!"
    end
  end

  factory :cabinet_job, class: Job do
    user factory: :job_creator
    name "Kitchen Cabinets"
    category "Cabinetry"
    description "Install Custom Kitchen Cabinets"
  end

end
