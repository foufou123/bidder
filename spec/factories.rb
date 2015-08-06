FactoryGirl.define do

  factory :user do
    password "password"

    factory :job_creator do
      email "mycabinetsneedfixing@example.com"
    end

    factory :contractor_user do
      email "contractor1user@example.com"
    end

    factory :competitor_user do
      email "contractor2user@example.com"
    end

    factory :another_job_creator do
      email "ineedpoolinstallation@example.com"
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

  factory :job do
    factory :cabinet_job do
      user factory: :job_creator
      name "Kitchen Cabinets"
      category "Cabinetry"
      description "Install Custom Kitchen Cabinets"
    end

    factory :another_cabinet_job do
      user factory: :another_job_creator
      name "Fix Cabinets"
      category "Cabinetry"
      description "Fix existing Cabinets"
    end
  end

  factory :interest do
    job factory: :cabinet_job

    factory :good_interest do
      contractor factory: :good_contractor
    end

    factory :competitor_interest do
      contractor factory: :competitor_contractor
    end
  end

  factory :skill_tag do
    factory :cabinetry_tag do
      name 'Cabinetry'
    end

    factory :pool_installation_tag do
      name 'Pool Installation'
    end

    factory :table_saw_tag do
      name 'Table Saw'
    end

    factory :staining_tag do
      name 'Staining'
    end
  end
end
