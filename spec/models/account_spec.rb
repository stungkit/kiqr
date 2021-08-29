# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe Account, type: :model do
    pending 'load Kiqr::Models::Account concern'
    pending 'has many users'
    pending 'belongs to an owner'
    pending 'can be created with only a name'
    pending 'validates name on update'
    pending 'validates billing_email on update'
    pending 'has pending_setup set to true on create'
    pending 'sets pending_setup to false if valid on update'
  end
end
